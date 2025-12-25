import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/model/specialties_model.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_history_card.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_specialties_card.dart';

class HomeSearchScreen extends StatefulWidget {
  const HomeSearchScreen({super.key});

  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Scaffold(
      appBar: const CustomAppBar(title: "Search"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextForm(
                  onSubmit: (value) {
                    if (value.isEmpty) return;
                    historyList.add(value);
                    setState(() {});
                    Navigation.push(context, Routes.doctorScreen, value);
                  },
                  hint: "Search for specialty",
                  controller: searchController,
                  prefix: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(AppImages.searchSvg),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyles.details.copyWith(
                      fontSize: 14,
                      color: AppColors.secondaryColor,
                    ),
                    children: [
                      const TextSpan(text: "Search by your location"),
                      const TextSpan(text: " "),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "129,El-Nasr Street, Cairo",
                            style: TextStyles.details.copyWith(
                              fontSize: 12,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                Align(
                  alignment: Alignment.centerLeft,

                  child: Text("All Specialities", style: TextStyles.title),
                ),
                const Gap(20),

                Wrap(
                  runSpacing: 15,
                  children: [
                    // ignore: unused_local_variable
                    for (var special in specialtiesList)
                      CustomSpecialtiesCard(specialtiesModel: special),
                  ],
                ),
                const Gap(20),
                Align(
                  alignment: Alignment.centerLeft,

                  child: Text("History", style: TextStyles.title),
                ),
                Wrap(
                  runSpacing: 15,
                  spacing: 5,
                  children: [
                    // ignore: unused_local_variable
                    for (var history in historyList)
                      CustomHistoryCard(historyText: history),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> historyList = [];
