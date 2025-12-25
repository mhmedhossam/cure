import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/add_new_card.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/to_back.dart';

class PaymentMethodSecond extends StatelessWidget {
  const PaymentMethodSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarprofile(title: 'Payment Method'),
      body: NOcard(),
    );
  }
}

class NOcard extends StatelessWidget {
  const NOcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Image.asset('assets/images/credit-card1.png'),
            const Text(
              "Nothing to display here! ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'georgia',
              ),
            ),
            const Text(
              "Add your cards to make payments easier",
              style: TextStyle(fontSize: 12, fontFamily: 'montserrat'),
            ),
            Spacer(flex: 3),
            SpecialButton(
              icon: true,
              title: "Add Card",
              onpressed: () {
                context.push(Routes.AddCardScreen);
              },
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

class SpecialButton extends StatelessWidget {
  const SpecialButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onpressed,
  });
  final bool icon;
  final String title;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onpressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon
              ? Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'montserrat',
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'montserrat',
                  ),
                ),
        ],
      ),
    );
  }
}

class thereCard extends StatelessWidget {
  const thereCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
