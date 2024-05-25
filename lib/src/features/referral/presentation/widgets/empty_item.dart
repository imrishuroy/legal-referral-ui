import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyItem extends StatelessWidget {
  const EmptyItem({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
