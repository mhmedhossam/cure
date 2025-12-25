import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/favourite_use_case.dart';
import 'toggle_favourite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  FavoriteCubit(this.toggleFavoriteUseCase) : super(FavoriteInitial());

  void toggleFavorite(int conversationId) async {
    emit(FavoriteLoading());
    final result = await toggleFavoriteUseCase(conversationId);
    result.fold(
      (failure) => emit(FavoriteError('Failed to toggle favorite')),
      (conversation) => emit(FavoriteToggled(conversation)),
    );
  }
}
