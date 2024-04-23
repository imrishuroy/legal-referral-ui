import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
      borderRadius: BorderRadius.circular(4.r),
      onTap: onPressed,
      child: Container(
        height: 57.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? LegalReferralColors.textGrey400,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.h,
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
      hoverColor: Colors.transparent,
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 57.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: LegalReferralColors.containerBlue100,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: LegalReferralColors.textWhite450,
              fontWeight: FontWeight.w600,
              fontSize: 18.h,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onTap,
    required this.icon,
    super.key,
  });

  final VoidCallback onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(child: icon),
    );
  }
}

class HorizontalIconButon extends StatelessWidget {
  const HorizontalIconButon({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
    this.height,
    this.width,
    this.iconColor,
    this.style,
  });
  final String text;
  final String icon;
  final double? height;
  final Color? iconColor;
  final TextStyle? style;
  final double? width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: height ?? 24.h,
            width: width ?? 24.w,
            color: iconColor,
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: style,
          ),
        ],
      ),
    );
  }
}
