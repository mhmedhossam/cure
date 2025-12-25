import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/model/specialties_model.dart';

class SpecialtiesScreen extends StatelessWidget {
  const SpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Specialties"),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 15,
              children: [
                for (var specialty in specialtiesList)
                  CustomSpecialtiesContainerCol(specialtyModel: specialty),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSpecialtiesContainerCol extends StatelessWidget {
  final SpecialtiesModel specialtyModel;
  const CustomSpecialtiesContainerCol({
    super.key,
    required this.specialtyModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.push(context, Routes.doctorScreen, specialtyModel.text);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.textFormColor,
        ),
        child: Column(
          children: [
            SvgPicture.asset(AppImages.bookingSvg),
            Text(
              specialtyModel.text,
              style: TextStyles.details.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
