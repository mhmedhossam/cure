import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/local_data_source/local_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_card_icon.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_dialog.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,

        leading: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              minRadius: 20,
              backgroundImage: AssetImage(AppImages.doctor),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back, ahmed",
              style: TextStyles.title.copyWith(fontSize: 14),
            ),
            GestureDetector(
              onTap: () {
                showGeneralDialogMethod(context);
              },
              child: RichText(
                text: TextSpan(
                  style: TextStyles.details.copyWith(fontSize: 12),
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: SvgPicture.asset(
                          AppImages.shipSvg,
                          height: 15,
                          width: 15,
                          colorFilter: const ColorFilter.mode(
                            AppColors.greyColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                      text:
                          ServiceLocator.gi<LocalDataSource>().location ??
                          "enter your location",
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
                        child: SvgPicture.asset(
                          AppImages.arrowDownSvg,
                          height: 7,
                          width: 7,
                          colorFilter: const ColorFilter.mode(
                            AppColors.greyColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        actions: [
          CustomCardIcon(
            onTap: () {
              Navigation.push(context, Routes.favouriteScreen);
            },
            assetName: AppImages.likeSvg,
          ),
          CustomCardIcon(
            assetName: AppImages.notificationSvg,
            onTap: () {
              Navigation.push(context, Routes.notificationScreen);
            },
          ),
        ],
      ),
    );
  }

  void showGeneralDialogMethod(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dialog",
      pageBuilder: (_, _, _) => CustomDialog(),
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (_, animation, _, child) {
        final fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
        );
        return FadeTransition(opacity: fadeAnimation, child: child);
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
