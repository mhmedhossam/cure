import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/RatingSummary.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/ReviewsAndRatingSection.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/SimpleReview.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/custom_doctor_profile.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({super.key, required this.doctorModel});
  final int doctorModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Profile Card
              const CustomDoctorProfile(),

              const SizedBox(height: 20),

              // About Me Section
              Text(
                'About me',
                style: TextStyles
                    .title, // Georgia/Subheading/Size TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                // doctorModel ??
                'Dr. Turner is a board-certified cardiologist with over 10 years of experience. She specializes in preventive cardiology and has published numerous research papers.',
                style: TextStyles
                    .details, //TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 20),
              const ReviewsAndRatingHeader(),

              // Reviews and Rating Section
              const SizedBox(height: 10),
              const RatingSummary(),
              // Rating Summary
              const SizedBox(height: 16),

              // Sample Review
              const SampleReview(),

              // const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
