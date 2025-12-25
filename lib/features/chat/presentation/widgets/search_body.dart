import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/search_Conversations/search_conversations_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/pages/chat_detail_screen.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/widgets/chat_item_widget.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchConversationsCubit, SearchConversationsState>(
        builder: (context, state) {
          if (state is SearchConversationsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchConversationsSuccess) {
            final chats = state.data;
            if (chats.isEmpty) {
              return const Center(child: Text("No chats found"));
            }
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatDetailsScreen(
                        name: chat.userName,
                        conversationId: chat.id,
                      ),
                    ),
                  ),
                  child: ChatListItem(
                    name: chat.userName,
                    message: chat.lastMessage ?? '',
                    time: DateFormat('hh:mm a').format(chat.updatedAt),
                    unreadCount: chat.unreadCount,
                  ),
                );
              },
            );
          } else if (state is SearchConversationsFailure) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
