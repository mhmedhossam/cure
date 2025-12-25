class MessageEntity {
  final int id;
  final int conversationId;
  final String body;
  final String type;
  final bool isMe;
  final DateTime createdAt;

  MessageEntity({
    required this.id,
    required this.conversationId,
    required this.body,
    required this.type,
    required this.isMe,
    required this.createdAt,
  });
}
