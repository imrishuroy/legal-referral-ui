import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.labelText,
    super.key,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.borderColor,
    this.fillColor,
    this.validator,
    this.minLines = 1,
    this.maxLines = 1,
    this.enabled = true,
    this.showLabel = true,
    this.autofocus = false,
    this.style,
  });

  final FocusNode? focusNode;
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final Color? borderColor;
  final Color? fillColor;
  final bool obscureText;
  final void Function(String?)? onChanged;
  final String? Function(String?)? onSubmitted;
  final String? Function(String?)? validator;
  final int minLines;
  final int? maxLines;
  final bool enabled;
  final bool showLabel;
  final bool autofocus;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLabel && labelText != null)
            Text(
              labelText!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          if (showLabel) SizedBox(height: 8.h),
          TextFormField(
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            minLines: minLines,
            enabled: enabled,
            onChanged: onChanged,
            autofocus: autofocus,
            onFieldSubmitted: onSubmitted,
            style: style ?? Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
              errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: LegalReferralColors.error,
                  ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: LegalReferralColors.textgrey300,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? LegalReferralColors.borderBlue300,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              filled: true,
              fillColor: fillColor ?? Colors.white,
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
