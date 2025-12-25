import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class CustomBottomPrice extends StatelessWidget {
  const CustomBottomPrice({super.key, this.onPressed, required this.title, required this.price});
  final void Function()? onPressed;
  final String title;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      height: 144,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price',
                style: TextStyles.title.copyWith(
                  fontFamily: 'Montserrat',
                ), //TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                r'\ hour',
                style: TextStyles.details.copyWith(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                ), //TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Spacer(),
              Text(
                '$price'r'$',
                style: TextStyles.details.copyWith(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',

                  color: AppColors.redColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Book Appointment Button
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: onPressed,
              //() {
              //   context.push(Routes.bookAppointmentScreen);

              //   //   Navigation.push(context, Routes.bookAppointmentScreen);
              //   //  GoRouter.of(context).push(Routes.bookAppointmentScreen);
              // },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                title, // 'Book Appointment',
                style: TextStyles.details.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
