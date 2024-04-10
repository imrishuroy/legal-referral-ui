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
    this.validator,
    this.maxLines = 1,
    this.enabled = true,
  });

  final FocusNode? focusNode;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: LegalReferralColors.black,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            cursorColor: LegalReferralColors.borderBlue300,
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            enabled: enabled,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.h,
              color: LegalReferralColors.black,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: LegalReferralColors.textgrey300,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              filled: true,
              fillColor: LegalReferralColors.containerWhite500,
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
