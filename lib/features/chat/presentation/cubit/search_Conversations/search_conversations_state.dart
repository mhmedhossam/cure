part of 'search_conversations_cubit.dart';

@immutable
sealed class SearchConversationsState {}

final class SearchConversationsInitial extends SearchConversationsState {}

final class SearchConversationsLoading extends SearchConversationsState {}

final class SearchConversationsSuccess extends SearchConversationsState {
  final List<ConversationEntity> data;

  SearchConversationsSuccess({required this.data});
}

final class SearchConversationsFailure extends SearchConversationsState {
  final String message;

  SearchConversationsFailure({required this.message});
}
