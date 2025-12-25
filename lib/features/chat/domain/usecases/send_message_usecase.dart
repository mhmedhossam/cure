import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/message_entity.dart';
import '../repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<Either<Failure, MessageEntity>> call({
    required int conversationId,
    required String body,
  }) {
    return repository.sendMessage(conversationId: conversationId, body: body);
  }
}

class SendFileMessageUseCase {
  final ChatRepository repository;

  SendFileMessageUseCase(this.repository);

  Future<Either<Failure, MessageEntity>> call({
    required int conversationId,
    required String body,
    String? filePath,
  }) {
    return repository.sendFileMessage(
      conversationId: conversationId,
      body: body,
      filePath: filePath,
    );
  }
}
