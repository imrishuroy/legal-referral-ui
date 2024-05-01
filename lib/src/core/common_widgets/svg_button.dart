import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  const SvgButton({
    required this.imagePath,
    required this.onPressed,
    this.height = 40.0,
    this.width = 40.0,
    super.key,
  });

  final String imagePath;
  final VoidCallback onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        imagePath,
        height: height,
        width: width,
      ),
    );
  }
}
