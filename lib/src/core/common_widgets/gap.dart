import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends StatelessWidget {
  const Gap({
    super.key,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h ?? 0,
      width: width?.w ?? 0,
    );
  }
}
