import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.labelText,
    super.key,
    this.validator,
    this.maxLines,
    this.obscureText,
    this.focusNode,
  });
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final int? maxLines;
  final bool? obscureText;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.h,
            color: LegalReferralColors.textBlack,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          cursorColor: LegalReferralColors.borderBlue300,
          controller: controller,
          maxLines: maxLines,
          focusNode: focusNode,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: LegalReferralColors.containerWhite500,
            errorStyle: const TextStyle(color: LegalReferralColors.error),
            hintText: hintText,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.h,
              color: LegalReferralColors.textgrey300,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: LegalReferralColors.borderBlue300,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: LegalReferralColors.borderBlue300,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: LegalReferralColors.borderBlue300,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: LegalReferralColors.borderBlue300,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
