import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.focusNode,
    super.key,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.enabled = true,
    this.showLabel = true,
  });

  final FocusNode? focusNode;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool enabled;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLabel)
            Text(
              labelText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          if (showLabel) SizedBox(height: 8.h),
          TextFormField(
            cursorColor: LegalReferralColors.borderBlue300,
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            enabled: enabled,
            onChanged: onChanged,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
              disabledBorder: OutlineInputBorder(
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
              filled: true,
              // fillColor: LegalReferralColors.containerWhite500,
              fillColor: Colors.white,
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
