import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/data/Models/BookingModels.dart';

class AppointmentCardUI extends StatelessWidget {
  // final String status;
  // final Color statusColor;
  // final String primaryBtn;
  // final String secondaryBtn;
  final BookingModels bookingModels;
  const AppointmentCardUI({super.key, required this.bookingModels});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date & Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: size.width * 0.04,
                    color: Colors.grey,
                  ),
                 // Image.asset("assets/images/img_patient3.png"),
                  const SizedBox(width: 6),
                  Text(
                    " ${bookingModels.appointmentDate} . ${bookingModels.appointmentTime}",
                    //'Monday, July 21 · 11:00 Am',
                    style: TextStyle(fontSize: size.width * 0.035),
                  ),
                ],
              ),
              Text(
                bookingModels.status ?? "",
                style: TextStyles.details.copyWith(
                  color: bookingModels.status == "pending"
                      ? AppColors.primaryColor
                      : bookingModels.status == "Completed"
                      ? AppColors.darkGreenColor
                      : bookingModels.status == "Canceled"
                      ? AppColors.redColor
                      : AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          SizedBox(height: size.height * 0.02),

          Row(
            children: [
              CircleAvatar(
                radius: size.width * 0.06,
                backgroundImage: NetworkImage(
                  bookingModels.doctor?.image ??
                      'https://randomuser.me/api/portraits/women/44.jpg',
                ),
                //Image.asset(AppImages.docImg, )
              ),
              SizedBox(width: size.width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookingModels.doctor?.name ?? "", //    'Jennifer Miller',
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    bookingModels.doctor?.speciality ?? "",
                    //  'Psychiatrist',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: size.width * 0.035,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: size.height * 0.02),

          Row(
            children: [
              Image.asset(AppImages.docImg, width: 30, height: 30),

              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  bookingModels.doctor?.address ?? "",
                  // '129, El-Nasr Street, Cairo, Egypt',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: size.height * 0.025),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    print(bookingModels.doctor?.id);
                    int id = bookingModels.doctor?.id ?? 0;
                    bookingModels.status == "pending"
                        ? GoRouter.of(context).push(
                            Routes.doctorDetailsScreen,
                            extra: id.toString(),
                          )
                        : bookingModels.status == "Completed"
                        ? GoRouter.of(context).push(
                            Routes.doctorDetailsScreen,
                            extra: id.toString(),
                          )
                        // Navigation.push(
                        //     context,
                        //     Routes.doctorDetailsScreen,
                        //     id ,
                        //   )
                        : bookingModels.status == "Canceled"
                        ? GoRouter.of(context).push(
                            Routes.doctorDetailsScreen,
                            extra: id.toString(),
                          )
                        : GoRouter.of(context).push(
                            Routes.doctorDetailsScreen,
                            extra: id.toString(),
                          );
                  },
                  style: ButtonStyle(
                    // Set your background color here
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Set your border radius here
                      ),
                    ),
                    side: WidgetStateProperty.all(
                      bookingModels.status == "pending"
                          ? const BorderSide(color: AppColors.greyColor)
                          : const BorderSide(color: AppColors.primaryColor),
                    ), // Optional: Set border color
                  ),
                  child: Text(
                    bookingModels.status == "pending"
                        ? "Cancel"
                        : bookingModels.status == "Completed"
                        ? "View details"
                        : bookingModels.status == "Canceled"
                        ? "Book again"
                        : "",
                    style: TextStyles.details.copyWith(
                      color: bookingModels.status == "pending"
                          ? AppColors
                                .primaryColor // AppColors.greyColor
                          : AppColors.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.03),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Reschedule",
                    style: TextStyles.details.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
