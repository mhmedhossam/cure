import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';

import '../../../core/utils/text_styles.dart';

class OnboardingContent {
  final String imagePath;
  final String title;
  final String description;

  OnboardingContent({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardingContent> onboardingData = [
  OnboardingContent(
    imagePath: AppImages.imagesFirstOnboardingImage,
    title: 'Book Your Appointment Easily',
    description:
        'Choose your preferred doctor, pick a\n suitable time, and confirm your visit\n in just a few taps. No calls, no waiting\n—just simple and fast booking.',
  ),
  OnboardingContent(
    imagePath: AppImages.imagesSecondOnboardingImage,
    title: 'Find Doctors Around You',
    description:
        'Quickly discover trusted doctors near\n your area. Whether you need\n a general checkup or a specialist, we\n connect you with nearby clinics for\n fast and convenient care.',
  ),
];

class OnboardingScreen extends StatelessWidget {
  final OnboardingContent content;

  const OnboardingScreen({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Image.asset(content.imagePath, fit: BoxFit.contain),
          ),
          const Gap(20),
          FittedBox(
            child: Text(
              content.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),

          const SizedBox(height: 16),

          FittedBox(
            child: Text(
              content.description,
              textAlign: TextAlign.center,
              style: TextStyles.details.copyWith(
                fontSize: 16,
                color: AppColors.greyColor,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Spacer(),
        ],
      ),
    );
  }
}
