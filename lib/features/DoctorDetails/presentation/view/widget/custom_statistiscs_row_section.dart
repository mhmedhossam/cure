import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/CustomStatistricsCardItems.dart';

class CustomStatisticsRowSection extends StatelessWidget {
  const CustomStatisticsRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomStatistricsCardItems(
          value: '2,000+',
          label: 'Patients',
          icon: Icons.people,
        ),
        CustomStatistricsCardItems(
          value: '10+',
          label: 'Years exp.',
          icon: Icons.work,
        ),
        CustomStatistricsCardItems(
          value: '4.5',
          label: 'Rating',
          icon: Icons.star_rounded,
        ),
        CustomStatistricsCardItems(
          value: '1,872',
          label: 'Reviews',
          icon: Icons.sms,
        ),
      ],
    );
  }
}
