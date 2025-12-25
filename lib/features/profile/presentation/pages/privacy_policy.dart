import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/custom_appbar.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/to_back.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarprofile(title: 'Privacy Policy'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Last Updated:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'georgia',
                          fontSize: 16,
                        ),
                      ),
                      Text(" 19/11/2024", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome to Cure. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information when you use our doctor appointment booking app.",
                    style: TextStyle(fontSize: 16, height: 1.1),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "terms & conditions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'georgia',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "By registering, accessing, or using this app, you confirm that you are at least 18 years old (or have parental/guardian consent if younger) and agree to be bound by these Terms and our Privacy Policy.",
                    style: TextStyle(fontSize: 16, height: 1.1),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "You agree to:",
                    style: TextStyle(fontSize: 16, height: 1.1),
                  ),
                  SizedBox(height: 5),
                  Text(
                    " • Use the app only for lawful purposes.\n"
                    " • Provide accurate and complete information\t during registration and booking.\n"
                    " • Not impersonate others or create fake accounts.",
                    style: TextStyle(height: 1.2),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "You may not:",
                    style: TextStyle(fontSize: 16, height: 1.1),
                  ),
                  SizedBox(height: 5),
                  Text(
                    " • Disrupt or interfere with the app's functionality.\n"
                    " • Try to access data or systems not meant for you.\n"
                    " • Use the app to harass or abuse doctors or staff.",
                    style: TextStyle(height: 1.2),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your data is handled in accordance with our [Privacy Policy]. You are responsible for keeping your login credentials secure.",
                    style: TextStyle(height: 1.2),
                  ),
                  SizedBox(height: 80), // مساحة للفلواتنج بوتون
                ],
              ),
            ),

            // Floating circle (مثل الدائرة الملونة)
          ],
        ),
      ),
    );
  }
}
