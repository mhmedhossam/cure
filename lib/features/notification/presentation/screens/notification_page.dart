import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../cubit/notification_cubit.dart';
import 'notification_data_screen.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetIt.instance<NotificationCubit>()..getNotifications(),
      child: const NotificationsDataScreen(),
    );

  }
}
