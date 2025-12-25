import '../../../domain/entities/conversation.dart';

abstract class FavoriteState {
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteToggled extends FavoriteState {
  final ConversationEntity conversation;

  FavoriteToggled(this.conversation);

  @override
  List<Object?> get props => [conversation];
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}
