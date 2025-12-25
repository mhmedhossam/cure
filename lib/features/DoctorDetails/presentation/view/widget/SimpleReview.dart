import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class SampleReview extends StatelessWidget {
  const SampleReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 31,
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/65.jpg',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nadia Reyna', style: TextStyles.title),
                    Text('30 min ago', style: TextStyles.details),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.yellowColor.withValues(alpha: 0.1),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.yellowColor,
                      size: 20,
                    ),
                    Text(
                      "4.5",
                      style: TextStyles.details.copyWith(
                        color: AppColors.yellowColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Excellent service! Dr. Jessica Turner was attentive and thorough. She took the time to explain everything clearly.',
            style: TextStyles.details,
          ),
        ],
      ),
    );
  }
}
