import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/error_handler.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/network_info.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/entities/doctor_model/datum.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;
  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Datum>>> getAllDoctors(
    String? searchName,
    String? searchLocation,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final List<Datum> getAllDoctors = await homeRemoteDataSource
          .getAllDoctors(searchName, searchLocation);
      return Right(getAllDoctors);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addToFavourite(int id) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      var res = await homeRemoteDataSource.addToFavourite(id);
      return Right(res);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> getDoctorsAvailability() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> getSingleDoctor() {
    throw UnimplementedError();
  }

  Future<Either<Failure, List<dynamic>>> searchByName() {
    throw UnimplementedError();
  }
}
