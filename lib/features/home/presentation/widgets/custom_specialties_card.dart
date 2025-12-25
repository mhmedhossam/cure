import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/model/specialties_model.dart';

class CustomSpecialtiesCard extends StatelessWidget {
  final SpecialtiesModel specialtiesModel;
  const CustomSpecialtiesCard({super.key, required this.specialtiesModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.push(context, Routes.doctorScreen, specialtiesModel.text);
      },
      child: IntrinsicWidth(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.iconColor.withValues(alpha: 0.7),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(specialtiesModel.icon, size: 19),
              const Gap(4),
              Text(
                specialtiesModel.text,
                style: TextStyles.details.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
