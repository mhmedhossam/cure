import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/entities/conversation.dart';
import '../../../../core/di/servies_locator.dart';

import '../cubit/send_and_load_message/send_message_cubit.dart';
import '../pages/chat_detail_screen.dart';
import 'chat_item_widget.dart';

class ChatListWidget extends StatefulWidget {
  final List<ConversationEntity> list;
  final Function(int count)? onSelectionChanged;

  const ChatListWidget({
    super.key,
    required this.list,
    this.onSelectionChanged,
  });

  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  final Set<int> selectedIndexes = {};
  bool selectionMode = false;

  void _updateParent() {
    widget.onSelectionChanged?.call(selectedIndexes.length);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        final chat = widget.list[index];
        final isSelected = selectedIndexes.contains(index);

        return GestureDetector(
          onLongPress: () {
            setState(() {
              selectionMode = true;
              selectedIndexes.add(index);
              _updateParent();
            });
          },
          onTap: () {
            if (selectionMode) {
              setState(() {
                isSelected
                    ? selectedIndexes.remove(index)
                    : selectedIndexes.add(index);

                if (selectedIndexes.isEmpty) {
                  selectionMode = false;
                }

                _updateParent();
              });
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) =>
                        ServiceLocator.gi<MessageCubit>()
                          ..loadMessages(chat.id),
                    child: ChatDetailsScreen(
                      name: chat.userName,
                      conversationId: chat.id,
                    ),
                  ),
                ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ChatListItem(
              name: chat.userName,
              message: chat.lastMessage ?? 'No message yet',
              time: DateFormat('hh:mm a').format(chat.updatedAt),
              unreadCount: chat.unreadCount,
            ),
          ),
        );
      },
    );
  }
}
