import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class ReviewsAndRatingHeader extends StatelessWidget {
  const ReviewsAndRatingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews and Rating',
          style: TextStyles
              .title, // TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            size: 18,
            Icons.edit_outlined,
            color: AppColors.primaryColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            print('edit');
          },
          child: Text(
            'add review',
            style: TextStyles.details.copyWith(
              color: AppColors.primaryColor,
              // fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
