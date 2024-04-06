import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_bottomsheet.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/new_password_page.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/otp_widget.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: Text(
          'Reset Password',
          style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Enter your registered email address or mobile number to '
                'receive the OTP to reset the password.',
                style: TextStyle(fontSize: 14.h),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomTextField(
                controller: _emailController,
                hintText: 'davidjohn2@gmail.com',
                labelText: 'Registered email address or mobile number',
              ),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                onTap: () {
                  emailBottomSheet(context);
                },
                text: 'Receive OTP',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> phoneBottomSheet(BuildContext context) {
    return CustomBottomSheet.show(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24.h),

          //* --- Enter OTP ---
          Row(
            children: [
              Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: 20.h,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          //* --- OTP widget ---

          OtpWidget(pinController: _pinController),
          SizedBox(
            height: 24.h,
          ),

          Wrap(
            children: [
              Text(
                ' 4 digit OTP has been send to ',
                style: TextStyle(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '+1 3******879',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                ' mobile number. ',
                style: TextStyle(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CustomTextButton(
                fontSize: 14.h,
                fontWeight: FontWeight.w600,
                text: 'CHANGE NUMBER',
                textColor: LegalReferralColors.textBlue100,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Wrap(
            children: [
              const Text("Didn't Received OTP? "),
              CustomTextButton(
                fontSize: 14.h,
                fontWeight: FontWeight.w600,
                text: 'RESEND OTP',
                textColor: LegalReferralColors.textBlue100,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomElevatedButton(
            onTap: () {
              Navigator.of(context).pop();
              _pinController.clear();
              successBottomSheet(context);
            },
            text: 'Verify',
          ),
        ],
      ),
    );
  }

  Future<dynamic> emailBottomSheet(BuildContext context) {
    return CustomBottomSheet.show(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24.h),

          //* --- Enter OTP ---
          Row(
            children: [
              Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: 20.h,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          //* --- OTP widget ---

          OtpWidget(pinController: _pinController),
          SizedBox(
            height: 24.h,
          ),

          Wrap(
            children: [
              Text(
                ' 4 digit OTP has been send to ',
                style: TextStyle(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'd*********9@**ail.com',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CustomTextButton(
                fontSize: 14.h,
                fontWeight: FontWeight.w600,
                text: 'CHANGE MAIL ID',
                textColor: LegalReferralColors.textBlue100,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Wrap(
            children: [
              const Text("Didn't Received OTP? "),
              CustomTextButton(
                fontSize: 14.h,
                fontWeight: FontWeight.w600,
                text: 'RESEND OTP',
                textColor: LegalReferralColors.textBlue100,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomElevatedButton(
            onTap: () {
              Navigator.of(context).pop();
              _pinController.clear();
              phoneBottomSheet(context);
            },
            text: 'Verify',
          ),
        ],
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
            'Verified',
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
                  builder: (context) => NewPasswordPage(),
                ),
              );
            },
            text: 'Set New Password',
          ),
        ],
      ),
    );
  }
}
