import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';

import '../entities/conversation.dart';
import '../repositories/chat_repository.dart';

class GetUnreadConversationsUseCase {
  final ChatRepository unreadConversation;

  GetUnreadConversationsUseCase({required this.unreadConversation});

  Future<Either<Failure, List<ConversationEntity>>> call(String unread) async {
    return await unreadConversation.getUnreadConversations(unread);
  }
}
