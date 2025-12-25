import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/entities/conversation.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/get_unread_conversations.dart';

part 'get_unread_conversations_state.dart';

class GetUnreadConversationsCubit extends Cubit<GetUnreadConversationsState> {
  final GetUnreadConversationsUseCase unreadConversationsUseCase;
  GetUnreadConversationsCubit(this.unreadConversationsUseCase)
    : super(GetUnreadConversationsInitial());

  Future<void> getUnreadConversations(String unread) async {
    emit(GetUnreadConversationsLoading());
    final result = await unreadConversationsUseCase(unread);
    result.fold(
      (failure) =>
          emit(GetUnreadConversationsFailure(message: failure.message)),
      (result) => emit(GetUnreadConversationsSuccess(data: result)),
    );
  }
}
