import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';

class ListtileNotification extends StatefulWidget {
  const ListtileNotification({super.key, required this.listTileComponent});

  final Map<String, dynamic> listTileComponent;

  @override
  State<ListtileNotification> createState() => _ListtileNotificationState();
}

class _ListtileNotificationState extends State<ListtileNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListTile(
        tileColor: AppColors.greyColor.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: SvgPicture.asset(
          widget.listTileComponent['icon'] as String,
          width: 20,
        ),
        title: Text(
          widget.listTileComponent['title'],
          style: TextStyle(
            color: widget.listTileComponent['BlackOrRed'] as bool
                ? Colors.black
                : Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'montserrat',
          ),
        ),
        trailing: Transform.translate(
          offset: const Offset(15, 0),
          child: Switch(
            value: true,
            onChanged: (value) {},
            // لون الدائرة لما يكون ON
            activeTrackColor:
                AppColors.darkGreenColor, // لون الـ track لما يكون ON
          ),
        ),
      ),
    );
  }
}
