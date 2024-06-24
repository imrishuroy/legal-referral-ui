import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.borderColor,
    this.borderRadius,
    this.textColor,
    this.height,
    this.width,
    this.borderWidth = 1,
  });

  final String text;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? textColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 57.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? LegalReferralColors.textGrey400,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
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
    this.style,
    this.maxline = 1,
  });
  final String text;
  final VoidCallback onPressed;
  final double? fontSize;
  final int maxline;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        maxLines: maxline,
        style: style ??
            TextStyle(
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
    required this.text,
    this.onTap,
    this.height,
    this.width,
    this.child,
    this.borderRadius,
    super.key,
    this.isLoading = false,
  });
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? borderRadius;
  final String text;
  final Widget? child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 57.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: onTap != null
              ? LegalReferralColors.containerBlue100
              : LegalReferralColors.textGrey400,
          borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
        ),
        child: Center(
          child: isLoading
              ? const CustomLoadingIndicator(
                  color: Colors.white,
                  lineWidth: 2,
                  size: 24,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: onTap != null
                            ? LegalReferralColors.textWhite450
                            : Colors.grey.shade300,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.h,
                      ),
                    ),
                    if (child != null) ...[
                      SizedBox(width: 4.w),
                      child!,
                    ],
                  ],
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

class HorizontalIconButton extends StatelessWidget {
  const HorizontalIconButton({
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
            // color: iconColor,
            colorFilter: ColorFilter.mode(
              iconColor ?? LegalReferralColors.textGrey400,
              BlendMode.srcIn,
            ),
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

class VerticalIconButton extends StatelessWidget {
  const VerticalIconButton({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key,
    this.height,
    this.width,
    this.textColor,
    this.iconColor,
  });
  final double? height;
  final double? width;
  final String icon;
  final String text;
  final Color? textColor;
  final VoidCallback onTap;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            height: height ?? 20.h,
            width: width ?? 20.w,
            icon,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                : null,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: textColor,
                ),
          ),
        ],
      ),
    );
  }
}
