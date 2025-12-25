import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class CustomHistoryCard extends StatelessWidget {
  final String historyText;
  const CustomHistoryCard({super.key, required this.historyText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.push(context, Routes.doctorScreen, historyText);
      },
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.iconColor.withValues(alpha: 0.7),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            historyText,
            style: TextStyles.details.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
