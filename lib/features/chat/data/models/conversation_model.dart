import '../../domain/entities/conversation.dart';

class ConversationModel extends ConversationEntity {
  ConversationModel({
    required super.id,
    required super.userName,
    super.userAvatar,
    super.lastMessage,
    required super.unreadCount,
    required super.isFavorite,
    required super.isArchived,
    required super.updatedAt,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    final otherUser = json['other_user'] ?? {};
    final lastMessage = json['last_message'] ?? {};
    return ConversationModel(
      id: json['id'],
      userName: otherUser['name'] ?? 'Unknown',
      userAvatar: otherUser['avatar'],
      lastMessage: lastMessage != null ? lastMessage['message'] : null,
      unreadCount: json['unread_count'] ?? 0,
      isFavorite: json['is_favorite'] ?? false,
      isArchived: json['is_archived'] ?? false,
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
