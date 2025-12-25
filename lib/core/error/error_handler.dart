import 'dart:io';
import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  // Convert any thrown error/exception into a Failure
  static Failure handle(dynamic error) {
    if (error is Failure) return error;
    if (error is DioException) return _fromDioException(error);
    if (error is SocketException) return NetworkFailure();

    if (error is Exception) {
      // Unknown non-Dio exception
      return UnknownFailure();
    }
    return UnknownFailure();
  }

  static Failure _fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioException.connectionError:
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure();

      case DioExceptionType.badResponse:
        final status = e.response?.statusCode;
        final data = e.response?.data;

        String errorMessage = _extractMessage(data) ?? 'Request failed';

        if (status == 401) {
          return UnauthorizedFailure(message: errorMessage);
        }

        if (status == 422 || status == 400 || status == 409) {
          return ValidationFailure(
            errorMessage,
            errors: data is Map ? data['errors'] : null,
          );
        }

        if (status != null && (status >= 500 && status < 600)) {
          return ServerFailure(errorMessage, statusCode: status);
        }

        return ServerFailure(errorMessage, statusCode: status);

      default:
        return UnknownFailure();
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data == null || data is! Map) return null;

    if (data['errors'] != null && data['errors'] is Map) {
      final errorsMap = data['errors'] as Map<String, dynamic>;

      if (errorsMap.isNotEmpty) {
        List<String> allErrors = [];

        errorsMap.forEach((key, value) {
          if (value is List) {
            allErrors.addAll(value.map((e) => e.toString()));
          } else if (value is String) {
            allErrors.add(value);
          }
        });

        if (allErrors.isNotEmpty) {
          return allErrors.join('\n');
        }
      }
    }

    if (data['message'] != null) {
      return data['message'].toString();
    }

    return null;
  }
}
