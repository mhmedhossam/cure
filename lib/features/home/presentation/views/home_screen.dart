import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_states.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_list_tile.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_position_image.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_position_texts.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_positioned_circle_image.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_text_button.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/list_view_builder_specialties_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: const CustomHomeAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextForm(
                  readonly: true,
                  onTap: () {
                    Navigation.push(context, Routes.homeSearchScreen);
                  },
                  hint: "Search for specially, doctor",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.name,
                  prefix: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SvgPicture.asset(AppImages.searchSvg),
                  ),
                  // validator: ,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Specialties", style: TextStyles.title),
                    CustomTextButton(
                      text: "view all",
                      onTap: () {
                        Navigation.push(context, Routes.specialtiesScreen);
                      },
                    ),
                  ],
                ),
                const Gap(10),

                const SizedBox(
                  height: 42,
                  child: ListViewBuilderSpecialtiesCard(),
                ),
                Gap(media.height * 0.03),

                Container(
                  width: double.infinity,
                  height: media.height * 0.25,
                  clipBehavior: Clip.antiAlias,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: AppColors.linearBlue,
                  ),
                  child: Stack(
                    children: [
                      const CustomPositionImage(
                        right: 0,
                        image: AppImages.homeVec,
                      ),
                      const CustomPositionImage(
                        right: 0,
                        bottom: 0,
                        image: AppImages.docImg,
                      ),
                      CustomPositionTexts(
                        text1: "Trusted doctor on your schedule 😉 ",
                        text2: "Consult A Doctor\n— Book Today! ",
                        textSize1: 12,
                        top: media.height * 0.02,
                        left: media.width * 0.06,
                        colorText1: AppColors.lightCian,
                      ),
                      CustomPositionedCircleImage(
                        bottom: media.height * 0.03,
                        left: media.width * 0.17,
                        image: AppImages.patientImg3,
                      ),
                      CustomPositionedCircleImage(
                        bottom: media.height * 0.03,
                        left: media.width * 0.11,
                        image: AppImages.patientImg2,
                      ),
                      CustomPositionedCircleImage(
                        bottom: media.height * 0.03,
                        left: media.width * 0.05,
                        image: AppImages.patientImg1,
                      ),
                      CustomPositionTexts(
                        text1: "30000+",
                        text2: "Happy patients",
                        textSize1: 12,
                        textSize2: 12,
                        left: media.width * 0.29,
                        bottom: media.height * 0.03,
                        colorText2: AppColors.lightCian,
                      ),
                    ],
                  ),
                ),
                Gap(media.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Doctors near you", style: TextStyles.title),
                    CustomTextButton(
                      text: "view all",
                      onTap: () {
                        Navigation.push(context, Routes.doctorNearYouScreen);
                      },
                    ),
                  ],
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeSucceededState) {
                      if (cubit.searchLocation != null) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.doctors.length > 2
                              ? 2
                              : cubit.doctors.length,

                          itemBuilder: (context, index) {
                            return CustomListTile(
                              doctor: cubit.doctors[index],
                              cubit: cubit,
                            );
                          },
                        );
                      }
                      if (cubit.searchLocation == null) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "No doctors near you",
                            style: TextStyles.details.copyWith(
                              fontSize: 15,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "please enter your location",
                            style: TextStyles.details.copyWith(
                              fontSize: 15,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        );
                      }
                    } else if (state is HomeLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is HomeFailureState) {
                      return Text(state.message);
                    } else {
                      return const Text("error please try again");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
