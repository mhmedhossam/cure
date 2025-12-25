import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';

class specialContainer extends StatelessWidget {
  const specialContainer({
    super.key,
    required this.listTileComponent,
    required this.onPressed,
  });

  final Map<String, dynamic> listTileComponent;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListTile(
        onTap: onPressed,
        tileColor: AppColors.greyColor.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: SvgPicture.asset(
          listTileComponent['icon'] as String,
          width: 20,
        ),
        title: Text(
          listTileComponent['title'],
          style: TextStyle(
            color: listTileComponent['BlackOrRed'] as bool
                ? Colors.black
                : Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'montserrat',
          ),
        ),
        trailing: listTileComponent['arrowIconOrNot'] as bool
            ? Icon(
                Icons.arrow_forward_ios,
                color: AppColors.greyColor.withValues(alpha: 0.6),
                size: 16,
              )
            : null,
      ),
    );
  }
}
