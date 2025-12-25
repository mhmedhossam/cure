import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/repository/home_repository.dart';

class AddToFavouriteUseCase {
  HomeRepository homeRepository;
  AddToFavouriteUseCase({required this.homeRepository});

  Future<Either<Failure, Map<String, dynamic>>> call(int id) async {
    return await homeRepository.addToFavourite(id);
  }
}
