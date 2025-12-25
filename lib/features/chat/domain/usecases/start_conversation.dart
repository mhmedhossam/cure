import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/repositories/chat_repository.dart';

class StartConversationUseCase {
  final ChatRepository repo;

  StartConversationUseCase({required this.repo});

  Future<Either<Failure, Map<String, dynamic>>> call(int userId) async {
    return await repo.startConversation(userId);
  }
}
