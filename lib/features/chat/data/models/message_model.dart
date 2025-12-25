import '../../domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.id,
    required super.conversationId,
    required super.body,
    required super.type,
    required super.isMe,
    required super.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      conversationId: json['conversation_id'],
      body: json['body'],
      type: json['type'],
      isMe: json['is_mine'], // 👈 من backend مباشرة
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
