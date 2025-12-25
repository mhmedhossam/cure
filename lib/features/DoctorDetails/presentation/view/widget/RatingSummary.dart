import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class RatingSummary extends StatelessWidget {
  const RatingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(
            '4.5',
            style: TextStyles.title.copyWith(
              fontSize: 50,
            ), //  TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          Text(
            '/5',
            style: TextStyles.title.copyWith(
              fontSize: 50,
            ), // TextStyle(fontSize: 24, color: Colors.grey),
          ),
          //  const SizedBox(width: 20),
          const Spacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star_half, color: Colors.amber, size: 16),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '1250+ Reviews',
                  style:
                      TextStyles.details, //(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
