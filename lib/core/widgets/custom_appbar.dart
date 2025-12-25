import 'package:flutter/material.dart';

import '../utils/text_styles.dart';
import 'custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final bool showBack;

  final List<Widget>? actions;
  final bool isCenterWidget;
  final Color backgroundColor;
  final Widget? widget;
  final Color titleColor;

  final double titleSize;

  final FontWeight titleWeight;

  final double height;

  const CustomAppBar({
    super.key,
    required this.title,
    this.widget,
    this.isCenterWidget = false,
    this.showBack = true,
    this.actions,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.titleSize = 18,
    this.titleWeight = FontWeight.w600,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: height,
        decoration: BoxDecoration(color: backgroundColor),
        child: Stack(
          alignment: showBack == false
              ? Alignment.centerRight
              : AlignmentGeometry.center,
          children: <Widget>[
            if (showBack) const Positioned(left: 10, child: CustomBackButton()),
            isCenterWidget
                ? widget ?? const SizedBox.shrink()
                : Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.header.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: titleColor,
                    ),
                  ),

            if (actions != null)
              Positioned(right: 0, child: Row(children: actions!)),
          ],
        ),
      ),
    );
  }
}
