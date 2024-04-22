import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class ToastUtil {
  ToastUtil._privateConstructor();

  static final ToastUtil _instance = ToastUtil._privateConstructor();

  static ToastUtil get instance {
    return _instance;
  }

  static void showToast(
    BuildContext context, {
    required String title,
    required String description,
    required ToastificationType type,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: Text(description),
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
  }
}
