import 'package:flutter/material.dart';

class CustomPositionImage extends StatelessWidget {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final String image;
  const CustomPositionImage({
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
      right: right,
      top: top,
      bottom: bottom,
      child: Image.asset(
        image,
        height: MediaQuery.sizeOf(context).height * 0.191,
      ),
    );
  }
}
