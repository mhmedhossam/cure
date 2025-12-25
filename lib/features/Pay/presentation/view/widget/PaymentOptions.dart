import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({
    super.key,
    required this.value,
    required this.title,
    required this.logo,
  });
  final String value;
  final String title;
  final String logo;
  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  String selectedPayment = "credit";
  bool get isSelected => selectedPayment == widget.value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = widget.value;
        });
      },
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          //Background/Semantic/Success/Lightest
          color: isSelected
              ? AppColors.darkGreenColor.withValues(alpha: 0.15)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Checkbox(value: value, onChanged: onChanged),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey,
                  width: 1,
                ),
                color: isSelected
                    ? Colors.green
                    : Colors.white, // Fill green when selected
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        size: 14,
                        color: Colors.white, // White check mark
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            //  Icon(icon, color: Colors.grey.shade700),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyles.details.copyWith(
                  color: isSelected
                      ? AppColors.darkGreenColor
                      : AppColors.secondaryColor,
                ),
              ),
            ),
            SvgPicture.asset(widget.logo),
          ],
        ),
      ),
    );
  }
}
