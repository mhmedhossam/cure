part of 'get_unread_conversations_cubit.dart';

@immutable
sealed class GetUnreadConversationsState {}

final class GetUnreadConversationsInitial extends GetUnreadConversationsState {}

final class GetUnreadConversationsLoading extends GetUnreadConversationsState {}

final class GetUnreadConversationsSuccess extends GetUnreadConversationsState {
  final List<ConversationEntity> data;

  GetUnreadConversationsSuccess({required this.data});
}

final class GetUnreadConversationsFailure extends GetUnreadConversationsState {
  final String message;

  GetUnreadConversationsFailure({required this.message});
}
