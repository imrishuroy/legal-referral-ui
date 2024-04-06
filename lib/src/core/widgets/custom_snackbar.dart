import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({super.key});

  static void showToast(
    BuildContext context, {
    required String? title,
    required String? description,
    required ToastificationType type,
  }) {
    Future.delayed(Duration.zero, () {
      toastification.show(
        context: context,
        type: type,
        style: ToastificationStyle.flatColored,
        title: Text(title ?? ''),
        description: Text(description ?? ''),
        alignment: Alignment.bottomLeft,
        autoCloseDuration: const Duration(seconds: 4),
        animationBuilder: (
          context,
          animation,
          alignment,
          child,
        ) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        foregroundColor: const Color(0xff000000),
        borderRadius: BorderRadius.circular(12.r),
        applyBlurEffect: true,
        showProgressBar: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
