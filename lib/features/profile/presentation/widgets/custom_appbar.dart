import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/widgets/to_back.dart';

class CustomAppBarprofile extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarprofile({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: toBack(),
      title: Text(
        title,
        style: TextStyle(fontFamily: 'georgia', fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
