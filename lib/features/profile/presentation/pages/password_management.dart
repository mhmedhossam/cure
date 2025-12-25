import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/settings/settings_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/settings/settings_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/payment_method_second.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/to_back.dart';

import '../../../../core/widgets/custom_snack_bar.dart';
import '../../domain/entities/change_password_param.dart';

class PasswordManagement extends StatefulWidget {
  const PasswordManagement({super.key});

  @override
  State<PasswordManagement> createState() => _PasswordManagementState();
}

class _PasswordManagementState extends State<PasswordManagement> {
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Password management"),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is SettingsSuccess) {
            CustomSnackBar.showSuccess(context, state.message);

            Navigator.pop(context);
          } else if (state is SettingsError) {
            CustomSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 4),
                  const Row(
                    children: [
                      Text(
                        "Current password",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  SpecialTextFormField(controller: currentPassController),
                  const Spacer(flex: 4),
                  const Row(
                    children: [
                      Text(
                        'New password',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  SpecialTextFormField(controller: newPassController),
                  const Spacer(flex: 4),
                  const Row(
                    children: [
                      Text(
                        'Confirm new password',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  SpecialTextFormField(controller: confirmPassController),
                  const Spacer(flex: 32),
                  SpecialButton(
                    icon: false,
                    title: 'change password',
                    onpressed: () {
                      context.read<SettingsCubit>().changePassword(
                        ChangePasswordParam(
                          currentPassword: currentPassController.text,
                          newPassword: newPassController.text,
                          confirmPassword: confirmPassController.text,
                        ),
                      );
                    },
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SpecialTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const SpecialTextFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
        hintText: 'Enter your password',
        hintStyle: const TextStyle(),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
          child: SvgPicture.asset('assets/icons/closed_eye.svg'),
        ),
      ),
    );
  }
}
