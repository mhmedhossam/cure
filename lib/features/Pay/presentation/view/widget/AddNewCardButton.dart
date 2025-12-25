import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class AddNewCardButton extends StatelessWidget {
  const AddNewCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: DottedBorder(
        options: const RoundedRectDottedBorderOptions(
          radius: Radius.circular(12),
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add, size: 24, color: AppColors.primaryColor),
              const SizedBox(width: 4),
              Text(
                "Add new card",
                style: TextStyles.details.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
