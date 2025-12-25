import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pinput.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_button.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/entities/otp_param.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../cubit/verify_otp_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OTPVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  int _resendTimer = 30;
  bool _isResendActive = false;
  String _currentOTP = '';

  String get _maskedPhoneNumber {
    if (widget.phoneNumber.length > 4) {
      final String lastDigits = widget.phoneNumber.substring(
        widget.phoneNumber.length - 2,
      );
      final String prefix = widget.phoneNumber.substring(0, 7);
      return "$prefix *** ***$lastDigits";
    }
    return widget.phoneNumber;
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _verifyCode() {
    if (_currentOTP.length != 4) {
      CustomSnackBar.showError(context, 'Please enter the 4-digit code');

      return;
    }
    context.read<VerifyOtpCubit>().verifyOtp(
      param: OtpParam(phone: widget.phoneNumber, otpCode: _currentOTP),
    );
  }

  void _resendCode() {
    if (_isResendActive) {
      context.read<VerifyOtpCubit>().resendOtp(phone: widget.phoneNumber);
    }
  }

  void _startTimer() {
    setState(() {
      _resendTimer = 30;
      _isResendActive = false;
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_resendTimer > 0) {
        setState(() {
          _resendTimer--;
        });
      } else {
        setState(() {
          _isResendActive = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: TextStyles.details,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400, width: 1.5),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: const CustomAppBar(title: 'OTP Code Verification'),

      body: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
        listener: (context, state) {
          if (state is VerifyOtpFailure) {
            CustomSnackBar.showError(context, state.error);
          }

          if (state is VerifyOtpSuccess) {
            Navigation.go(context, Routes.signInScreen);          }
          if (state is ResendOtpFailure) {
            CustomSnackBar.showError(context, state.error);
          }
          if (state is ResendOtpSuccess) {
            CustomSnackBar.showSuccess(context, state.message);

            _startTimer();
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is VerifyOtpLoading || state is ResendOtpLoading,
            opacity: 0.3,
            color: AppColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 50),
                Text(
                  'Code has been send to $_maskedPhoneNumber',
                  textAlign: TextAlign.center,
                  style: TextStyles.title,
                ),
                const SizedBox(height: 40),

                Center(
                  child: Pinput(
                    controller: _pinController,
                    focusNode: _focusNode,
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    onChanged: (value) {
                      setState(() {
                        _currentOTP = value;
                      });
                    },
                    onCompleted: (pin) {
                      _verifyCode();
                    },
                    validator: (pin) {
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isResendActive
                        ? GestureDetector(
                            onTap: _resendCode,
                            child: Text(
                              'Resend',
                              style: TextStyles.details.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          )
                        : Text(
                            'Resend code in $_resendTimer s',
                            style: TextStyles.details,
                          ),

                    if (_isResendActive && state is! ResendOtpLoading)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('Or', style: TextStyle(color: Colors.grey)),
                      ),

                    if (_isResendActive)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigation.pop(context);                            },
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            'Change Number',
                            style: TextStyles.details,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomButton(
                  title: 'Verify',
                  onPressed: state is VerifyOtpLoading ? () {} : _verifyCode,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
