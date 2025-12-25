import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/entities/conversation.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/get_conversations/chat_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/get_conversations/chat_state.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/get_unread_conversations/get_unread_conversations_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/search_Conversations/search_conversations_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/pages/search_screen.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/widgets/chat_header.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/widgets/custom__tabs.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/widgets/custom_build_chat_list.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _Controller = TextEditingController();
  int selectedCount = 0;
  bool isSelectionMode = false;
  String topTitle = "Chats";

  @override
  void initState() {
    context.read<ChatCubit>().fetchChats();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(
          () => topTitle = [
            "Chats ",
            "Unread",
            "Favorites",
          ][_tabController.index],
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _Controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              //header chat chow number of selected chats
              ChatHeader(
                isSelectionMode: isSelectionMode,
                selectedCount: selectedCount,
                title: topTitle,
                onClear: () => setState(() {
                  isSelectionMode = false;
                  selectedCount = 0;
                }),
              ),
              const Gap(10),

              // search field
              CustomTextForm(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => GetIt.instance<SearchConversationsCubit>(),
                      child: const SearchScreen(),
                    ),
                  ),
                ),
                fillColor: AppColors.textFormColor,
                hint: "Search for chat, doctor",
                prefix: const Icon(Icons.search, color: AppColors.iconColor),
                readonly: true,
              ),
              const Gap(10),

              //============tabs
              ChatTabBar(controller: _tabController),
              const Gap(12),

              // body that contain chats
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    if (state is ChatLoading)
                      return const Center(child: CircularProgressIndicator());
                    if (state is ChatLoaded) {
                      return TabBarView(
                        controller: _tabController,
                        children: [
                          //all chats
                          _buildList(state.conversations),
                          BlocBuilder<
                            GetUnreadConversationsCubit,
                            GetUnreadConversationsState
                          >(
                            builder: (context, unreadState) {
                              if (unreadState
                                  is GetUnreadConversationsLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (unreadState
                                  is GetUnreadConversationsSuccess) {
                                //unread chats
                                return _buildList(unreadState.data);
                              }
                              if (unreadState
                                  is GetUnreadConversationsFailure) {
                                return Center(child: Text(unreadState.message));
                              }
                              return const SizedBox();
                            },
                          ),
                          const Center(child: Text("No Favorites")),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper
  Widget _buildList(List<ConversationEntity> list) {
    return ChatListWidget(
      list: list,
      onSelectionChanged: (count) => setState(() {
        selectedCount = count;
        isSelectionMode = count > 0;
      }),
    );
  }
}
