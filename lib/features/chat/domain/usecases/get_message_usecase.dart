import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/message_entity.dart';
import '../repositories/chat_repository.dart';

class GetConversationMessagesUseCase {
  final ChatRepository repository;

  GetConversationMessagesUseCase(this.repository);

  Future<Either<Failure, List<MessageEntity>>> call(int conversationId) {
    return repository.getConversationMessages(conversationId);
  }
}
