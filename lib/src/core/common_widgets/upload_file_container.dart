import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class UploadFileContainer extends StatelessWidget {
  const UploadFileContainer({
    required this.onTap,
    required this.hintText,
    super.key,
  });
  final VoidCallback onTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: LegalReferralColors.containerWhite500,
          border: Border.all(
            color: LegalReferralColors.borderBlue300,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                IconStringConstants.uploadIcon,
              ),
            ),
            Text(
              hintText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.h,
                fontWeight: FontWeight.w400,
                color: LegalReferralColors.textGrey400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
