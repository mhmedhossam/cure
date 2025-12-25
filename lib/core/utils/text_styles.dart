import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_fonts.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';

class TextStyles {
  static final TextStyle title = const TextStyle(
    fontFamily: AppFonts.title,
    fontSize: 20,
    color: AppColors.secondaryColor,
  );
  static final TextStyle details = const TextStyle(
    fontFamily: AppFonts.details,
    fontSize: 14,
    color: AppColors.greyColor,
  );
  static final TextStyle header = const TextStyle(
    fontFamily: AppFonts.header,
    fontSize: 24,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
  );
}
