import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/entities/conversation.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/repositories/chat_repository.dart';

class SearchConversations {
  final ChatRepository repo;

  SearchConversations({required this.repo});

  Future<Either<Failure, List<ConversationEntity>>> call(String name) async {
    return await repo.searchConversations(name);
  }
}
