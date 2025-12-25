import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/custom_appbar.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarprofile(title: 'FAQs'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            FaqItem(
              question: 'What is this app used for?',
              answer:
                  'This app allows you to search for doctors, book appointments, and consult in person easily from your phone.',
              isExpanded: true,
            ),
            FaqItem(
              question: 'Is the app free to use?',
              answer: 'Yes, the app is free to download and use.',
            ),
            FaqItem(
              question: 'How can I find a doctor?',
              answer:
                  'You can search by specialty, location, or doctor name using the search feature.',
            ),
            FaqItem(
              question: 'Can I cancel my appointment?',
              answer:
                  'Yes, you can cancel your appointment from the appointments section.',
            ),
            FaqItem(
              question: 'What payment are supported?',
              answer: 'We support cash and multiple online payment methods.',
            ),
            FaqItem(
              question: 'How do I edit my profile?',
              answer: 'Go to profile settings and choose edit profile.',
            ),
          ],
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;

  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        initiallyExpanded: isExpanded,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        children: [
          Text(answer, style: const TextStyle(color: Colors.grey, height: 1.4)),
        ],
      ),
    );
  }
}
