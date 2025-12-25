import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/manager/ProfileDetailsCubit/profile_details_cubit.dart';

class CustomDoctorProfile extends StatelessWidget {
  const CustomDoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
      builder: (context, state) {
        if (state is ProfileDetailsSucess) {
          return Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          state.detailsModels.specialty.image ??
                              'https://randomuser.me/api/portraits/women/44.jpg',
                          //  'https://randomuser.me/api/portraits/women/44.jpg',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.detailsModels.name ?? "",
                              //  'Dr. Jessica Turner',
                              style: TextStyles.title,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              state.detailsModels.name ?? "",
                              //'Dr. Jessica Turner',
                              style: TextStyles.details,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.shipSvg,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.primaryColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                Text(
                                  state.detailsModels.clinicAddress ??
                                      " ", // ' 1234 Main Street, Cairo',
                                  style: TextStyles.details,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_sharp,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Statistics Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem('2,000+', 'Patients', Icons.people),
                  _buildStatItem(
                    '${state.detailsModels.experienceYears}+',
                    'Years exp.',
                    Icons.work,
                  ),
                  _buildStatItem('4.5', 'Rating', Icons.star_rounded),
                  _buildStatItem('1,872', 'Reviews', Icons.sms),
                ],
              ),
            ],
          );
        } else if (state is ProfileDetailsFailure) {
          return Center(child: Text(state.emessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(
          icon, //color: iconColor ?? Colors.blue,
          size: 28,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyles.title.copyWith(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ), // const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyles
              .details, // const TextStyle(fontSize: 12, color: Colors.grey)
        ),
      ],
    );
  }
}
