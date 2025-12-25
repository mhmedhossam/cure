import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../domain/entities/sign_in_param.dart';
import '../cubit/sign_in_cubit.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          CustomSnackBar.showError(context, state.error);
        }
        if (state is SignInSuccess) {
          CustomSnackBar.showSuccess(context, state.message);
          Navigation.go(context, Routes.mainScreen);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading,
          opacity: 0.3,
          color: AppColors.primaryColor,
          progressIndicator: const SpinKitThreeBounce(color: AppColors.primaryColor, size: 30.0),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Gap(20),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset(
                        AppImages.imagesSignInImage,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 20),

                    FittedBox(
                      child: Text(
                        'Enter your phone number',
                        style: TextStyles.header.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                         ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Image.asset(AppImages.iconsFlag, width: 20),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextForm(
                            hint: 'Enter your number',
                            controller: phoneController,
                            fillColor: AppColors.lightGrey,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    CustomTextForm(
                      hint: 'Enter your password',
                      controller: passwordController,
                      fillColor: AppColors.lightGrey,
                      prefix: const Icon(Icons.password),
                      isPassword: true,
                    ),

                    const SizedBox(height: 30),

                    CustomButton(
                      title: 'Sign in with your Phone number',
                      // isLoading: state is SignInLoading,
                      onPressed: () {
                        context.read<SignInCubit>().signIn(
                          param: SignInParam(phone: phoneController.text.trim(),password: passwordController.text.trim()),
                        );
                        log("Sign in button pressed phone ${phoneController.text.trim()}");
                        log("Sign in button pressed password${passwordController.text.trim()}");

                      },
                    ),

                    const SizedBox(height: 20),

                    const Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'or',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),

                    const SizedBox(height: 20),

                    CustomButton(
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey,
                      title: 'Sign in with Google',
                      onPressed: () {
                        CustomSnackBar.showWarning(context,'This feature is not implemented yet.');
                      },
                      textColor: Colors.black87,
                      icon: Image.asset(AppImages.iconsGoogle, height: 24),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigation.push(context, Routes.signUpScreen);                            },
                          child: Text(
                            'Sign up',
                            style: TextStyles.details.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
