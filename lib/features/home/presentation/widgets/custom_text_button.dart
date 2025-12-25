import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const CustomTextButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyles.details.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
