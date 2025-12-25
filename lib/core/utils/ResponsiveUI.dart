import 'package:flutter/widgets.dart';

double getresponsivefontsize(BuildContext context, {required double fontsize}) {
  double scaleFacter = getscalefacter(context);
  double result = fontsize * scaleFacter;
  double lower = fontsize * 0.7;
  double upper = fontsize * 0.9;
  return result.clamp(lower, upper);
}

double getscalefacter(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width > 600) {
    return width / 700;
  } else {
    return width / 300;
  }
}
