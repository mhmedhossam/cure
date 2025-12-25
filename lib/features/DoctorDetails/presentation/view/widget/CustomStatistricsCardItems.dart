import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class CustomStatistricsCardItems extends StatelessWidget {
  const CustomStatistricsCardItems({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    this.iconColor,
  });
  final String value;
  final String label;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon, //color: iconColor ?? Colors.blue,
          size: 28,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyles.title.copyWith(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ), // const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyles
              .details, // const TextStyle(fontSize: 12, color: Colors.grey)
        ),
      ],
    );
  }
}
