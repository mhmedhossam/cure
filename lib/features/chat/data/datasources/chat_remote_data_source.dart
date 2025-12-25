import 'package:round_8_mobile_cure_team3/features/chat/data/models/conversation_model.dart';

import '../models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ConversationModel>> getConversations();
  Future<List<ConversationModel>> searchConversations(String name);
  Future<List<ConversationModel>> unreadConversations();
  Future<Map<String, dynamic>> startConversation(int userId);
  Future<List<MessageModel>> getConversationMessages(int conversationId);
  Future<MessageModel> sendMessage({
    required int conversationId,
    required String body,
  });

  Future<ConversationModel> toggleFavorite(int conversationId);
  Future<MessageModel> sendFileMessage({
    required int conversationId,
    required String body,
    String? filePath,
  });
}
