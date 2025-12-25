import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class CustomPositionTexts extends StatelessWidget {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final String text1;
  final String text2;
  final double? textSize1;
  final double? textSize2;
  final Color? colorText1;
  final Color? colorText2;
  const CustomPositionTexts({
    this.left,
    this.right,
    this.top,
    this.bottom,
    super.key,
    this.textSize1,
    this.textSize2,
    this.colorText1,
    this.colorText2,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyles.header.copyWith(
              fontSize: textSize1,
              color: colorText1,
            ),
          ),
          Text(
            text2,
            style: TextStyles.header.copyWith(
              fontSize: textSize2,
              color: colorText2,
            ),
          ),
        ],
      ),
    );
  }
}
