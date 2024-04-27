import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class CustomBottomSheet {
  static Future<dynamic> show({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    bool? isDismissible,
  }) {
    return showModalBottomSheet(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 32.w,
      ),
      isDismissible: isDismissible ?? false,
      backgroundColor: LegalReferralColors.containerWhite500,
      enableDrag: false,
      isScrollControlled: isScrollControlled,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          // bottom: MediaQuery.of(context).viewInsets.bottom,
          // bottom: MediaQuery.of(context).viewInsets.bottom.h,
        ),
        child: child,
      ),
    );
  }
}
