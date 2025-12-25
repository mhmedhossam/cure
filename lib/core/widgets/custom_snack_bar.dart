import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
      BuildContext context, {
        required String message,
        required Color backgroundColor,
        required IconData icon,
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Tajawal',
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        elevation: 6,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

   static void showError(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: const Color(0xFFE53935),
      icon: Icons.error_outline,
    );
  }

   static void showSuccess(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: const Color(0xFF43A047),
      icon: Icons.check_circle_outline,
    );
  }

   static void showWarning(BuildContext context, String message) {
    show(
      context,
      message: message,
      backgroundColor: const Color(0xFFFB8C00),
      icon: Icons.warning_amber_rounded,
    );
  }
}