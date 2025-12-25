import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/entities/conversation.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ConversationEntity>>> getConversations();
  Future<Either<Failure, List<ConversationEntity>>> searchConversations(
    String name,
  );
  Future<Either<Failure, List<ConversationEntity>>> getUnreadConversations(
    String unread,
  );

  Future<Either<Failure, Map<String, dynamic>>> startConversation(int userId);

  Future<Either<Failure, List<MessageEntity>>> getConversationMessages(
    int conversationId,
  );
  Future<Either<Failure, MessageEntity>> sendMessage({
    required int conversationId,
    required String body,
  });

  Future<Either<Failure, ConversationEntity>> toggleFavorite(
    int conversationId,
  );

  Future<Either<Failure, MessageEntity>> sendFileMessage({
    required int conversationId,
    required String body,
    String? filePath,
  });
}
