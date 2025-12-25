class ConversationEntity {
  final int id;
  final String userName;
  final String? userAvatar;
  final String? lastMessage;
  final int unreadCount;
  final bool isFavorite;
  final bool isArchived;
  final DateTime updatedAt;

  ConversationEntity({
    required this.id,
    required this.userName,
    this.userAvatar,
    this.lastMessage,
    required this.unreadCount,
    required this.isFavorite,
    required this.isArchived,
    required this.updatedAt,
  });
}
