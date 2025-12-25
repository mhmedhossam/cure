import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/conversation.dart';
import '../../../domain/usecases/search_conversations.dart';
part 'search_conversations_state.dart';

class SearchConversationsCubit extends Cubit<SearchConversationsState> {
  final SearchConversations search;

  SearchConversationsCubit(this.search) : super(SearchConversationsInitial());

  Future<void> searchConversations(String name) async {
    emit(SearchConversationsLoading());
    final result = await search(name);

    result.fold(
      (failure) {
        emit(SearchConversationsFailure(message: failure.message));
      },
      (result) {
        emit(SearchConversationsSuccess(data: result));
      },
    );
  }
}
