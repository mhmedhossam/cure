import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.pop(context);
      },
      child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
    );
  }
}
