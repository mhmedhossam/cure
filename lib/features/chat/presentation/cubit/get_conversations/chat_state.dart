import '../../../domain/entities/conversation.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ConversationEntity> conversations;
  ChatLoaded(this.conversations);
}

class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}
