import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';

class PasswordResetModel extends StatelessWidget {
  const PasswordResetModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 32,
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom.h,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.h),
            SizedBox(
              height: 114.h,
              width: 114.w,
              child: SvgPicture.asset(
                IconStringConstants.successLogo,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'New Password Saved!',
              style: TextStyle(
                fontSize: 24.h,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              onTap: () {
                context.pop();
                context.goNamed(SignInPage.name);
              },
              text: 'Log In',
            ),
          ],
        ),
      ),
    );
  }
}
