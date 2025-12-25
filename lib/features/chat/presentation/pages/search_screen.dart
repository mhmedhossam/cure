import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/search_Conversations/search_conversations_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/widgets/search_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      final cubit = context.read<SearchConversationsCubit>();
      if (cubit.isClosed) return;
      if (value.isNotEmpty) {
        cubit.searchConversations(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "search"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              CustomTextForm(
                fillColor: AppColors.textFormColor,
                hint: "Search for chat, doctor",
                controller: _searchController,
                keyboardType: TextInputType.text,
                prefix: const Icon(Icons.search, color: AppColors.iconColor),
                onChanged: _onSearchChanged,
              ),
              const Gap(10),
              Text(
                "history",
                style: TextStyles.header.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  _buildHistoryTag("robert"),
                  const Gap(8),
                  _buildHistoryTag("jessica"),
                ],
              ),
              const Gap(12),
              const SearchBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryTag(String name) {
    return ElevatedButton.icon(
      onPressed: () {
        _searchController.text = name;
        _onSearchChanged(name);
      },
      icon: const CircleAvatar(
        radius: 12,
        backgroundColor: AppColors.whiteColor,
        child: Icon(Icons.history, size: 16, color: AppColors.secondaryColor),
      ),
      label: Text(name.toLowerCase()),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: AppColors.greyColor,
      ),
    );
  }
}
