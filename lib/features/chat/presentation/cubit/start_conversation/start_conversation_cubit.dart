import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/entities/conversation.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/start_conversation.dart';

import '../../../data/models/conversation_model.dart';

part 'start_conversation_state.dart';

class StartConversationCubit extends Cubit<StartConversationState> {
  final StartConversationUseCase startConversation;
  StartConversationCubit(this.startConversation)
    : super(StartConversationInitial());

  Future<void> fetchStartConversation(int userId) async {
    emit(StartConversationLoading());
    final result = await startConversation(userId);
    result.fold(
      (failure) => emit(StartConversationFailure(message: failure.message)),
      (result) {
        final conversation = ConversationModel.fromJson(result['data']);

        emit(StartConversationSuccess(data: conversation, id: conversation.id));
      },
    );
  }
}
