import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_button.dart';

import '../../../core/utils/text_styles.dart';
import 'onboarding_screen.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _finishOnboarding() {
    Navigation.go(context, Routes.signInScreen);
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingData.length,
        (index) => Container(
          width: index == _currentPage ? 20.0 : 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            color: index == _currentPage
                ? AppColors.primaryColor
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentPage == onboardingData.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    _finishOnboarding();
                  },
                  child: Text(
                    'Skip',
                    style: TextStyles.title.copyWith(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingScreen(content: onboardingData[index]);
                  },
                ),
              ),

              _buildPageIndicator(),
              const SizedBox(height: 40),

              CustomButton(
                title: isLastPage ? 'Get Started' : 'Next',
                onPressed: () {
                  if (isLastPage) {
                    _finishOnboarding();
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  }
                },
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
