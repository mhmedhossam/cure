import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_states.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/model/specialties_model.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_list_tile.dart';

// ignore: must_be_immutable
class DoctorScreen extends StatefulWidget {
  DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: "Doctors"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomTextForm(
                hint: "Search for specialty doctor",
                controller: TextEditingController(),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    cubit.searchName = value;
                    cubit.getAllDoctors();
                  }
                },
                prefix: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(AppImages.searchSvg),
                ),
              ),
              const Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomChoiceChip(
                        isIcon: false,
                        gKey: cubit.chipKeys["All"]!,
                        assetName: AppImages.chatSvg,
                        selected: cubit.selectedString == "All",
                        onSelected: (value) {
                          cubit.selectedString = "All";
                          cubit.searchName = "";
                          cubit.getAllDoctors();
                          //----------------
                          setState(() {});
                        },
                        text: "All",
                      ),
                      for (int i = 0; i < specialtiesList.length; i++)
                        CustomChoiceChip(
                          gKey: cubit.chipKeys[specialtiesList[i].text]!,
                          isIcon: true,
                          assetName: AppImages.chatSvg,
                          text: specialtiesList[i].text,

                          selected:
                              cubit.selectedString == specialtiesList[i].text,
                          onSelected: (_) {
                            cubit.selectedString = specialtiesList[i].text;
                            cubit.searchName = cubit.selectedString;
                            cubit.getAllDoctors();
                            //-----------------
                            setState(() {});
                            Scrollable.ensureVisible(
                              cubit
                                  .chipKeys[cubit.selectedString]!
                                  .currentContext!,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              const Gap(20),

              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSucceededState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: cubit.doctors.length,
                        itemBuilder: (context, index) {
                          return CustomListTile(
                            doctor: cubit.doctors[index],
                            cubit: cubit,
                          );
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
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

class CustomChoiceChip extends StatelessWidget {
  final void Function(bool)? onSelected;
  final bool selected;
  final bool isIcon;
  final String text;
  final String assetName;
  final GlobalKey gKey;
  const CustomChoiceChip({
    super.key,
    this.onSelected,
    required this.selected,
    required this.isIcon,
    required this.text,
    required this.assetName,
    required this.gKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: ChoiceChip(
        key: gKey,
        padding: const EdgeInsets.all(10),
        avatar: isIcon
            ? SvgPicture.asset(
                assetName,
                colorFilter: ColorFilter.mode(
                  selected ? AppColors.whiteColor : AppColors.secondaryColor,
                  BlendMode.srcIn,
                ),
              )
            : null,

        onSelected: onSelected,
        selected: selected,
        showCheckmark: false,
        backgroundColor: AppColors.whiteColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppColors.greyColor.withValues(alpha: 0.3)),
        ),
        selectedColor: AppColors.primaryColor,
        label: Text(
          text,
          style: TextStyles.details.copyWith(
            color: selected ? AppColors.whiteColor : AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
