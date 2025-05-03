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
    // Dismiss any existing toasts before showing a new one
    toastification.dismissAll();
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

  static void showUndoToast(
    BuildContext context, {
    required String title,
    required ToastificationType type,
    required VoidCallback onUndo,
  }) {
    // Dismiss any existing toasts before showing a new one
    toastification.dismissAll();
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: const Color(0xff4caf50),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  onUndo();
                  toastification.dismissAll();
                },
                child: const Text(
                  'Undo',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
