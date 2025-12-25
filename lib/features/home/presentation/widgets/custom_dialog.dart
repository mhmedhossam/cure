import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_rich_text.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String location = "enter your location";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Your location", style: TextStyles.title),
            Divider(
              color: AppColors.greyColor.withValues(alpha: 0.2),
              indent: 20,
              endIndent: 20,
            ),
            const Gap(10),

            CustomRichText(location: location, assetName: AppImages.shipSvg),
            const Gap(27),
            DottedBorder(
              options: const RoundedRectDottedBorderOptions(
                radius: Radius.circular(10),
                dashPattern: [10, 6],
                strokeWidth: 1,
                color: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 2),
              ),
              child: CustomButton(
                backgroundColor: AppColors.whiteColor,
                title: "Add new address",
                onPressed: () async {
                  Navigation.pop(context);
                  final result = await Navigation.push(
                    context,
                    Routes.currentLocationScreen,
                  );
                  if (result != null) {
                    location = result['address'];

                    print(location);
                    setState(() {});
                  }
                },
                textColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
