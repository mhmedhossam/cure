import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/special_container.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/to_back.dart';

import '../../../../core/constants/navigation.dart';
import '../../../../core/di/servies_locator.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../auth/data/data_sources/local/local_auth.dart';
import '../cubit/settings/settings_cubit.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final token = ServiceLocator.gi<LocalAuth>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) async {
        if (state is SettingsSuccess) {
          CustomSnackBar.showSuccess(context, state.message);

          await token.deleteToken();

          if (context.mounted) {
            Navigation.pushReplacement(context, Routes.splashScreen);
          }
        } else if (state is SettingsError) {
          CustomSnackBar.showError(context, state.message);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBarprofile(title: 'Setting'),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Spacer(flex: 1),
                specialContainer(
                  listTileComponent: settingDataUi.settingTileData[0],
                  onPressed: () {
                    context.push(Routes.passwordManagmentScreen);
                  },
                ),
                Spacer(flex: 1),
                specialContainer(
                  listTileComponent: settingDataUi.settingTileData[1],
                  onPressed: () => showDeleteDialog(context),
                ),
                Spacer(flex: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text("Are you sure? This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              context.read<SettingsCubit>().deleteAccount();
              Navigator.pop(dialogContext);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class settingDataUi {
  static final List<Map<String, dynamic>> settingTileData = [
    {
      'icon': 'assets/icons/password.svg',
      'title': 'Password Management',
      'BlackOrRed': true,
      'arrowIconOrNot': true,
    },
    {
      'icon': 'assets/icons/person2.svg',
      'title': 'Delete Account',
      'BlackOrRed': true,
      'arrowIconOrNot': false,
    },
  ];
}
