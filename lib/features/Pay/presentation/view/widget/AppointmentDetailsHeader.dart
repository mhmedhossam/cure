import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';

class AppointmentDetailsHeader extends StatelessWidget {
  const AppointmentDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const SizedBox(width: 12),
          Text(
            'Friday, July 17, 4:00pm',
            style: TextStyles.details.copyWith(color: AppColors.secondaryColor),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Text(
              'Reschedule',
              style: TextStyles.details.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
