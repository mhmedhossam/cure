import 'package:flutter/material.dart';

class CustomPositionedCircleImage extends StatelessWidget {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final String image;
  const CustomPositionedCircleImage({
    this.left,
    this.right,
    this.top,
    this.bottom,
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      right: right,
      top: top,
      child: CircleAvatar(backgroundImage: AssetImage(image)),
    );
  }
}
