import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/attorney_details.dart';

class ActiveReferral extends StatelessWidget {
  const ActiveReferral({
    required this.attorneyName,
    required this.attorneyType,
    required this.profileImage,
    this.style,
    this.radius,
    super.key,
  });
  final String? attorneyName;
  final String? attorneyType;
  final String? profileImage;
  final TextStyle? style;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: LegalReferralColors.containerWhite500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AttorneyDetails(
            attorneyName: attorneyName,
            attorneyType: attorneyType,
            profileImage: profileImage,
            style: style,
            radius: radius,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SvgPicture.asset(IconStringConstants.favIcon),
              Text(
                '4.3 by 433 attorneys • 422 project',
                style: textTheme.bodyLarge
                    ?.copyWith(color: LegalReferralColors.textGrey400),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          RichText(
            text: TextSpan(
              text: 'Price: ',
              style: textTheme.titleMedium
                  ?.copyWith(color: LegalReferralColors.textGrey400),
              children: <TextSpan>[
                TextSpan(
                  text: r'$50/hr',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  width: 96.w,
                  height: 48.h,
                  textColor: LegalReferralColors.textBlue100,
                  borderColor: LegalReferralColors.borderBlue300,
                  onPressed: () {},
                  text: 'Award',
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: CustomOutlinedButton(
                  width: 96.w,
                  height: 48.h,
                  textColor: LegalReferralColors.textBlue100,
                  borderColor: LegalReferralColors.borderBlue300,
                  onPressed: () {},
                  text: 'Message',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
