import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/message_entity.dart';
import '../../../domain/usecases/get_message_usecase.dart';
import '../../../domain/usecases/send_message_usecase.dart';
import 'send_message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final GetConversationMessagesUseCase getMessagesUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final SendFileMessageUseCase sendFileMessageUseCase;

  final List<MessageEntity> _messages = [];

  MessageCubit(
    this.getMessagesUseCase,
    this.sendMessageUseCase,
    this.sendFileMessageUseCase,
  ) : super(MessageInitial());

  Future<void> loadMessages(int conversationId) async {
    emit(MessageLoading());

    final result = await getMessagesUseCase(conversationId);

    result.fold(
      (failure) {
        emit(MessageError(failure.message));
      },
      (data) {
        _messages
          ..clear()
          ..addAll(data);
        emit(MessageLoaded(List.from(_messages)));
      },
    );
  }

  Future<void> sendMessage(int conversationId, String text) async {
    if (text.trim().isEmpty) return;

    /// optimistic message
    final tempMessage = MessageEntity(
      id: -1,
      conversationId: conversationId,
      body: text,
      type: 'text',
      isMe: true,
      createdAt: DateTime.now(),
    );

    _messages.add(tempMessage);
    emit(MessageLoaded(List.from(_messages)));

    final result = await sendMessageUseCase(
      conversationId: conversationId,
      body: text,
    );

    result.fold(
      (failure) {
        _messages.remove(tempMessage);
        emit(MessageError(failure.message));
        emit(MessageLoaded(List.from(_messages)));
      },
      (realMessage) {
        final index = _messages.indexOf(tempMessage);
        if (index != -1) {
          _messages[index] = realMessage;
        }
        emit(MessageLoaded(List.from(_messages)));
      },
    );
  }

  Future<void> sendFileMessage({
    required int conversationId,
    required String body,
    String? filePath,
  }) async {
    final result = await sendFileMessageUseCase(
      conversationId: conversationId,
      body: body,
      filePath: filePath,
    );

    result.fold((failure) => emit(MessageError(failure.message)), (message) {
      _messages.add(message);
      emit(MessageLoaded(List.from(_messages)));
    });
  }
}
