import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';

class ChatTabBar extends StatelessWidget {
  final TabController controller;
  const ChatTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: TabBar(
        controller: controller,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.whiteColor,
        unselectedLabelColor: AppColors.greyColor,
        indicator: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        tabs: const [
          Tab(text: "All"),
          Tab(text: "Unread"),
          Tab(text: "Favorites"),
        ],
      ),
    );
  }
}
