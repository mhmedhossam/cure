import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/message_entity.dart';
import '../cubit/send_and_load_message/send_message_cubit.dart';
import '../cubit/send_and_load_message/send_message_state.dart';

class ChatMessageBody extends StatefulWidget {
  const ChatMessageBody({super.key, required this.messages});
  final List<MessageEntity> messages;

  @override
  State<ChatMessageBody> createState() => _ChatMessageBodyState();
}

class _ChatMessageBodyState extends State<ChatMessageBody> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        if (state is MessageLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MessageError) {
          return Center(child: Text(state.message));
        }

        if (state is MessageLoaded) {
          // Scroll to bottom when new messages are loaded
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom(),
          );

          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(12),
            reverse: false,
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              final message = state.messages[index];
              final isMe = message.isMe;

              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  decoration: BoxDecoration(
                    color: isMe ? AppColors.primaryColor : AppColors.iconColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: isMe
                          ? const Radius.circular(16)
                          : Radius.zero,
                      bottomRight: isMe
                          ? Radius.zero
                          : const Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    message.body,
                    style: TextStyle(
                      color: isMe
                          ? AppColors.whiteColor
                          : AppColors.secondaryColor,
                    ),
                  ),
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
