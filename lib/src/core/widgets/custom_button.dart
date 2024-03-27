import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.borderColor,
    this.borderRadius,
    this.textColor,
  });

  final String text;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double? borderRadius;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(4),
      onTap: onPressed,
      child: Container(
        height: 57,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? LegalReferralColors.textGrey400,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textColor ?? LegalReferralColors.textGrey400,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });
  final String text;
  final VoidCallback onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.onTap,
    required this.text,
    super.key,
  });
  final VoidCallback onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 57,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(89, 158, 217, 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(252, 252, 252, 1),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
