// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class AttorneyDetails extends StatelessWidget {
  final String? attorneyName;
  final String? attorneyType;
  final String? profileImage;
  final TextStyle? style;
  final double? radius;
  const AttorneyDetails({
    required this.attorneyName,
    required this.attorneyType,
    required this.profileImage,
    required this.style,
    required this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: LegalReferralColors.borderGrey300,
            ),
          ),
          child: CustomAvatar(
            imageUrl: profileImage,
            radius: radius ?? 22.r,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              attorneyName ?? '',
              style: style ?? Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              attorneyType ?? '',
              style: 
                  Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: LegalReferralColors.textGrey500),
            ),
          ],
        ),
      ],
    );
    /*
    ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: LegalReferralColors.borderGrey300,
          ),
        ),
        child: CustomAvatar(
          imageUrl: profileImage,
          radius: radius ?? 22.r,
        ),
      ),
      title: Text(
        attorneyName ?? '',
        style: style ?? Theme.of(context).textTheme.labelMedium,
      ),
      subtitle: Text(
        attorneyType ?? '',
        style: style ?? Theme.of(context).textTheme.labelMedium,
      ),
    );
    */
  }
}
