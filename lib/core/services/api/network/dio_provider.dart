import 'package:dio/dio.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/main_endpoint.dart';

class DioProvider {
  static late Dio dio;
  //initalize dio
  static init() {
    dio = Dio(BaseOptions(baseUrl: MainEndpoint.baseUrl));
  }


  // get

  static Future<Response<Map<String, dynamic>>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  //post

  static Future<Response<Map<String, dynamic>>> post(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headres,
  }) async {
    return await dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headres),
    );
  }  //post

  static Future<Response<Map<String, dynamic>>> put(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headres,
  }) async {
    return await dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headres),
    );
  }

  //patch

  static Future<Response<Map<String, dynamic>>> patch(
    String endPoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.patch(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  //delete

  static Future<Response<Map<String, dynamic>>> delete(
    String endPoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.delete(
      endPoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}
