import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';

class CustomCardIcon extends StatelessWidget {
  final String assetName;
  final void Function() onTap;
  const CustomCardIcon({
    super.key,
    required this.assetName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: AppColors.greyColor.withValues(alpha: 0.2),
              spreadRadius: 2,
            ),
          ],
          // elevation: 3,
          // shadowColor: AppColors.greyColor.withValues(alpha: 0.5),
          borderRadius: BorderRadiusGeometry.circular(11),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(assetName, height: 12, width: 14),
        ),
      ),
    );
  }
}
