import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_bottomsheet.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const String name = 'ForgotPasswordPage';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: LegalReferralColors.primaryBackground,
        centerTitle: false,
        title: Text(
          'New Password',
          style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Enter new password',
                  labelText: 'New password',
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm password',
                  labelText: 'Confirm password',
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomElevatedButton(
                  onTap: () => successBottomSheet(context),
                  text: 'Reset Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> successBottomSheet(BuildContext context) {
    return CustomBottomSheet.show(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24.h),
          SizedBox(
            height: 114.h,
            width: 114.w,
            child: SvgPicture.asset(
              ImageStringsUtil.successLogo,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'New Password Saved',
            style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40.h),
          CustomElevatedButton(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                ),
              );
            },
            text: 'Log In',
          ),
        ],
      ),
    );
  }
}
