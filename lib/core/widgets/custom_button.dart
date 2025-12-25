import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';

import '../utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isDisabled;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? icon;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.icon,
    this.textColor,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 1)
                : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: icon == null
            ? _TextOnly(title, textColor ?? AppColors.whiteColor)
            : _IconWithText(
                title,
                icon ?? const SizedBox(),
                textColor ?? AppColors.whiteColor,
              ),
      ),
    );
  }
}

class _TextOnly extends StatelessWidget {
  final String title;
  final Color color;

  const _TextOnly(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        title,
        style: TextStyles.details.copyWith(
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _IconWithText extends StatelessWidget {
  final String title;
  final Widget icon;
  final Color color;

  const _IconWithText(this.title, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 8),
        FittedBox(
          child: Text(
            title,
            style: TextStyles.details.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
