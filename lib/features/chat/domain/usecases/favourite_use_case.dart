import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/conversation.dart';
import '../repositories/chat_repository.dart';

class ToggleFavoriteUseCase {
  final ChatRepository repository;

  ToggleFavoriteUseCase(this.repository);

  Future<Either<Failure, ConversationEntity>> call(int conversationId) {
    return repository.toggleFavorite(conversationId);
  }
}
