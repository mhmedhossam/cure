import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';

import '../../data/models/notification_model.dart';
import '../cubit/notification_cubit.dart';
import 'notification_empty_screen.dart';

class NotificationsDataScreen extends StatelessWidget {
  const NotificationsDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CustomAppBar(title: 'Notifications'),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(
              child: SpinKitThreeBounce(
                color: AppColors.primaryColor,
                size: 35.0,
              ),
            );
          }

          if (state is NotificationSuccess) {
            if (state.notifications.isEmpty) {
              return const NotificationsEmptyScreen();
            }

            final sortedNotifications =
                List<NotificationDetail>.from(state.notifications)
                  ..sort((a, b) {
                    if (a.read == b.read) return 0;
                    return a.read == false ? -1 : 1;
                  });

            return _buildList(sortedNotifications);
          }

          if (state is NotificationError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildList(List<NotificationDetail> notifications) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return _buildNotificationTile(notifications[index]);
      },
    );
  }

  Widget _buildNotificationTile(NotificationDetail item) {
    final bool isUnread = item.read == false;

    final iconData = isUnread
        ? Icons.notifications_none
        : Icons.check_circle_outline;

    final iconColor = isUnread
        ? AppColors.primaryColor
        : AppColors.darkGreenColor;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isUnread ? Colors.grey[200] : Colors.transparent, // فضي كاشف
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: iconColor, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? '',
                  style: TextStyle(
                    fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.body ?? '',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            item.createdAt.toString(),
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
