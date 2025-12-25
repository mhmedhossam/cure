import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';

class NotificationsEmptyScreen extends StatelessWidget {
  const NotificationsEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Image.asset(
                  AppImages.imagesNotificationImage,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),

              const Text(
                'Nothing to display here!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                "We'll notify you once we have new notifications.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
