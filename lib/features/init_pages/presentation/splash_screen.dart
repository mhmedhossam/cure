import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/local/local_auth.dart';

import '../../../core/di/servies_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int _durationInSeconds = 3;
  double _opacity = 0.0;
  LocalAuth authLocal = ServiceLocator.gi<LocalAuth>();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 200), () {
      _opacity = 1.0;
      setState(() {});
      setState(() {});
    });
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Timer(Duration(seconds: _durationInSeconds), () {
      if (authLocal.getToken() != null) {
        Navigation.go(context, Routes.onBoardingScreen);
      } else
        Navigation.go(context, Routes.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: _opacity,
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(child: Image.asset(AppImages.iconsWhiteAppIcon)),

                const SpinKitThreeBounce(color: Colors.white, size: 30.0),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
