import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.grey.shade800,
          ),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(64.r),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.grey.shade400,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
      ),
    );
  }
}
