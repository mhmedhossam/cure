import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_text_form_field.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/register_param.dart';
import 'package:round_8_mobile_cure_team3/features/auth/presentation/register/cubit/register_cubit.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void _register() {

    print(context.read<RegisterCubit>());

    print('REGISTER BUTTON CLICKED');

    final rawNumber = phoneController.text.trim();
    final fullPhoneNumber = '+20$rawNumber';

    if (rawNumber.isEmpty || rawNumber.length < 8) {
      CustomSnackBar.showError(context,'Please enter a valid phone number');
      return;
    }

    context.read<RegisterCubit>().register(
      param: RegisterParam(
        password: passwordController.text,
        phone: fullPhoneNumber,
        email: emailController.text,
        name: fullNameController.text,
        password_confirmation: passwordConfirmController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {

          CustomSnackBar.showError(context,state.error);

        }
        final fullPhoneNumber = '+20${phoneController.text.trim()}';

        if (state is RegisterSuccess) {
          Navigation.push(context,Routes.otpVerifyScreen , fullPhoneNumber);        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading,
          opacity: 0.3,
          color: AppColors.primaryColor,
          progressIndicator: const SpinKitThreeBounce(color: AppColors.primaryColor, size: 30.0),

          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const CustomAppBar(title: ''),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      AppImages.iconsBlueAppIcon,
                      width: 70,
                      height: 70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Create New Account',
                    textAlign: TextAlign.center,
                    style: TextStyles.header.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 30),
          
                  CustomTextForm(
                    hint: 'FullName',
                    prefix: const Icon(Icons.person_outline),
                    controller: fullNameController,
                    fillColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 20),
                  CustomTextForm(
                    hint: 'Email',
                    prefix: const Icon(Icons.email_outlined),
                    controller: emailController,
                    fillColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 10),
          
                  CustomTextForm(
                    hint: 'Enter your password',
                    controller: passwordController,
                    fillColor: AppColors.lightGrey,
                    prefix: const Icon(Icons.password),
                    isPassword: true,

                  ),
                  const SizedBox(height: 10),
          
                  CustomTextForm(
                    hint: 'Confirm your password',
                    controller: passwordConfirmController,
                    fillColor: AppColors.lightGrey,
                    prefix: const Icon(Icons.password),
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),

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
                            const Icon(Icons.arrow_drop_down, color: Colors.grey),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextForm(
                          hint: 'Enter your number',
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          fillColor: AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: 'Sign up',
                    onPressed: _register,
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('or', style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 20),
          
                  CustomButton(
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey,
                    title: 'Sign up with Google',
                    onPressed: () {
                      CustomSnackBar.showWarning(context,'This feature is not implemented yet.');
          
                    },
                    icon: Image.asset(AppImages.iconsGoogle, height: 24),
                    textColor: Colors.black87,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyles.details.copyWith(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigation.pop(context);
                        },
                        child: Text(
                          'Sign in',
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
        );
      },
    );
  }
}
