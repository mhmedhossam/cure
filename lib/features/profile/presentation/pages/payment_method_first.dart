import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/custom_appbar.dart';

class PaymentMethodFirst extends StatefulWidget {
  const PaymentMethodFirst({super.key});

  @override
  State<PaymentMethodFirst> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethodFirst> {
  int _selectedRadio = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarprofile(title: 'Payment Method'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Credit / Debit Cards",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'georgia',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            PaymentMethodListTile(
              icon: 'assets/icons/visa.svg',
              title: "VISA",
              onPressed: () {
                context.push(Routes.paymentMethodSecondScreen);
              },
            ),
            PaymentMethodListTile(
              icon: 'assets/icons/mastercard.svg',
              title: "MasterCard",
              onPressed: () {
                context.push(Routes.paymentMethodSecondScreen);
              },
            ),
            const SizedBox(height: 30),
            const Text(
              "Mobile Wallets",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'georgia',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            PaymentMethodRadio(
              icon: 'assets/icons/apple_pay.svg',
              title: "Apple Pay",
              radioNumber: 1,
              groupValue: _selectedRadio,
              onChanged: (value) {
                setState(() {
                  _selectedRadio = value!;
                });
              },
            ),
            PaymentMethodRadio(
              icon: 'assets/icons/paypal.svg',
              title: "PayPal",
              radioNumber: 2,
              groupValue: _selectedRadio,
              onChanged: (value) {
                setState(() {
                  _selectedRadio = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodListTile extends StatelessWidget {
  const PaymentMethodListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });
  final String icon;
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: () {
          onPressed;
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: AppColors.greyColor.withValues(alpha: 0.1),
        leading: SvgPicture.asset(icon, width: 40),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'montserrat',
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.iconColor,
        ),
      ),
    );
  }
}

class PaymentMethodRadio extends StatelessWidget {
  const PaymentMethodRadio({
    super.key,
    required this.icon,
    required this.title,
    required this.radioNumber,
    required this.groupValue,
    required this.onChanged,
  });
  final String icon;
  final String title;
  final int radioNumber;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: () {
          onChanged(radioNumber);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: AppColors.greyColor.withValues(alpha: 0.1),
        leading: SvgPicture.asset(icon, width: 40),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'montserrat',
          ),
        ),
        trailing: Transform.translate(
          offset: const Offset(16, 0),
          child: Radio(
            value: radioNumber,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: const Color.fromARGB(255, 112, 45, 122),
          ),
        ),
      ),
    );
  }
}
