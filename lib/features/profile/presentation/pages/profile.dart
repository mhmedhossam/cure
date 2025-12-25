import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_keys.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/local/local_auth.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/local_data_source/local_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/profile/data/models/user_model.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/profile_state.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/profile_state.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/listTile_notification.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/profile_data_UI.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/special_container.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          Navigation.go(context, Routes.signInScreen);
        }
      },

      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(
              child: SpinKitThreeBounce(
                color: AppColors.primaryColor,
                size: 35.0,
              ),
            ),
          );
        }
        if (state is ProfileError) {
          return Scaffold(body: Center(child: Text(state?.message ?? "")));
        }
        if (state is ProfileLoaded) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    const MainContainer(),
                    const SizedBox(height: 30),
                    ListtileNotification(
                      listTileComponent: DataUi.ListTileData[0],
                    ),
                    specialContainer(
                      listTileComponent: DataUi.ListTileData[1],
                      onPressed: () {
                        context.push(Routes.paymentMethodFirstScreen);
                      },
                    ),
                    specialContainer(
                      listTileComponent: DataUi.ListTileData[2],
                      onPressed: () {
                        context.push(Routes.favouriteScreen);
                      },
                    ),
                    specialContainer(
                      listTileComponent: DataUi.ListTileData[3],
                      onPressed: () {
                        context.push(Routes.settingsScreen);
                      },
                    ),
                    specialContainer(
                      listTileComponent: DataUi.ListTileData[4],
                      onPressed: () {
                        context.push(Routes.faqsScreen);
                      },
                    ),
                    specialContainer(
                      listTileComponent: DataUi.ListTileData[5],
                      onPressed: () {
                        context.push(Routes.privacyPolicyScreen);
                      },
                    ),
                    specialContainer(
                      listTileComponent: DataUi.ListTileData[6],
                      onPressed: () {
                        ServiceLocator.gi<LocalAuth>().delete(
                          AppKeys.TOKEN_KEY,
                        );
                        Navigation.go(context, Routes.signInScreen);
                        ServiceLocator.gi<LocalDataSource>()
                            .deleteLocation(); // متمسحهاش
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(child: Text("something went wrong")),
        );
      },
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.push(context, Routes.editProfileScreen);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColors.greyColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.jpg"),
                radius: 30,
              ),
            ),

            const Column(
              children: [
                Text(
                  'Mohamed',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'georgia',
                  ),
                ),
                Text(
                  '129,EL-Nasr Street, Cairo',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const Spacer(flex: 1),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
