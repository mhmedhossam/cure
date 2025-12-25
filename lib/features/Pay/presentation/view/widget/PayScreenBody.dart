import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/custom_doctor_profile.dart';
import 'package:round_8_mobile_cure_team3/features/Pay/presentation/manager/cubit/save_date_cubit.dart';

class PayScreenBody extends StatefulWidget {
  const PayScreenBody({super.key});

  @override
  State<PayScreenBody> createState() => _PayScreenBodyState();
}

class _PayScreenBodyState extends State<PayScreenBody> {
  String selectedPayment = 'credit';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Profile Card
              const CustomDoctorProfile(),
              const SizedBox(height: 20),

              // Appointment Details
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  //  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/calender.svg",
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      "${SaveDateCubit.days}    ${SaveDateCubit.dates}",
                      style: TextStyles.details.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),

                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'Reschedule',
                        style: TextStyles.details.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Payment Method
              Text('Payment Method', style: TextStyles.title),
              const SizedBox(height: 16),

              // Credit Card Option
              _buildPaymentOption(
                'credit',
                'Credit Card',
                Icons.credit_card,
                'assets/icons/paypal.svg',
                //'assets/icons/Visa.svg',
              ),
              const SizedBox(height: 8),

              // PayPal Option
              _buildPaymentOption(
                'paypal',
                'PayPal',
                Icons.account_balance_wallet,
                'assets/icons/paypal.svg',
              ),
              const SizedBox(height: 12),

              // Apple Pay Option
              _buildPaymentOption(
                'apple',
                'Apple Pay',
                Icons.phone_iphone,
                'assets/icons/paypal.svg',

                //   'assets/icons/iconApplePay.svg',
              ),
              const SizedBox(height: 8),

              // Add New Card Button
              SizedBox(
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
                        const Icon(
                          Icons.add,
                          size: 24,
                          color: AppColors.primaryColor,
                        ),
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
              ),
              const SizedBox(height: 24),
              // const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    String value,
    String title,
    IconData icon,
    String logo,
  ) {
    bool isSelected = selectedPayment == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = value;
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
          // border: Border.all(
          //   color: isSelected ? Colors.blue : Colors.grey.shade300,
          //   width: isSelected ? 2 : 1,
          // ),
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
                title,
                style: TextStyles.details.copyWith(
                  color: isSelected
                      ? AppColors.darkGreenColor
                      : AppColors.secondaryColor,
                ),
              ),
            ),
            SvgPicture.asset(logo),

            // if (logo != null)
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade100,
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Text(
            //       title == 'Credit Card' ? 'VISA' : title,
            //       style: const TextStyle(
            //         fontSize: 12,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
