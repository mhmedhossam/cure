part of 'start_conversation_cubit.dart';

@immutable
sealed class StartConversationState {}

final class StartConversationInitial extends StartConversationState {}

final class StartConversationLoading extends StartConversationState {}

final class StartConversationSuccess extends StartConversationState {
  final ConversationEntity data;
  final int id;

  StartConversationSuccess({required this.data, required this.id});
}

final class StartConversationFailure extends StartConversationState {
  final String message;

  StartConversationFailure({required this.message});
}
