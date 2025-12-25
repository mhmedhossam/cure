import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.location,
    required this.assetName,
  });

  final String location;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyles.details.copyWith(fontSize: 12),
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SvgPicture.asset(
                assetName,
                height: 15,
                width: 15,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          TextSpan(
            text: location,
            style: TextStyles.details.copyWith(
              color: AppColors.primaryColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
