import 'package:equatable/equatable.dart';

import '../../../domain/entities/message_entity.dart';

abstract class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object?> get props => [];
}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageLoaded extends MessageState {
  final List<MessageEntity> messages;

  const MessageLoaded(this.messages);

  @override
  List<Object?> get props => [messages]; // ✅ REQUIRED
}

class MessageError extends MessageState {
  final String message;

  const MessageError(this.message);

  @override
  List<Object?> get props => [message];
}
