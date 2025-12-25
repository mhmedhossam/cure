import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/get_conversations.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/get_conversations/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetConversations getConversationsUseCase;

  ChatCubit(this.getConversationsUseCase) : super(ChatInitial());

  Future<void> fetchChats() async {
    emit(ChatLoading());

    final result = await getConversationsUseCase();
    result.fold(
      (failure) {
        emit(ChatError(failure.message));
      },

      (conversations) {
        emit(ChatLoaded(conversations));
      },
    );
  }
}
