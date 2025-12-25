import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/local_data_source/local_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_states.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_list_tile.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_rich_text.dart';

class DoctorNearYouScreen extends StatelessWidget {
  const DoctorNearYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        isCenterWidget: true,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomRichText(
              location: "your location",
              assetName: AppImages.shipSvg,
            ),
            GestureDetector(
              onTap: () {
                Navigation.pushReplacement(
                  context,
                  Routes.currentLocationScreen,
                );
                // _showGeneralDialogMethod(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ServiceLocator.gi<LocalDataSource>().location ??
                        "enter your location",
                  ),
                  const Gap(5),
                  SvgPicture.asset(AppImages.arrowDownSvg),
                ],
              ),
            ),
          ],
        ),
        title: "title",
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundImage: AssetImage(AppImages.docImg)),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              CustomTextForm(
                hint: "Search for Specialty ,doctor",
                controller: TextEditingController(),
                prefix: Padding(
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(AppImages.searchSvg),
                ),
                onChanged: (value) {
                  cubit.searchName = value;

                  cubit.getAllDoctors();
                },
              ),
              const Gap(10),

              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSucceededState) {
                    if (cubit.doctors.isEmpty) {
                      return const Center(
                        child: Text("there is no doctor near you"),
                      );
                    }
                    return Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${cubit.doctors.length} Results",
                              style: TextStyles.title.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: cubit.doctors.length,

                              itemBuilder: (context, i) {
                                return CustomListTile(
                                  doctor: cubit.doctors[i],
                                  cubit: cubit,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is HomeLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Text("some thing error please try again");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void _showGeneralDialogMethod(BuildContext context) {
//   showGeneralDialog(
//     context: context,
//     barrierDismissible: true,
//     barrierLabel: "Dialog",
//     pageBuilder: (_, _, _) => CustomDialog(),
//     transitionDuration: const Duration(milliseconds: 500),
//     transitionBuilder: (_, animation, _, child) {
//       final fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
//         CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
//       );
//       return FadeTransition(opacity: fadeAnimation, child: child);
//     },
//   );
// }
