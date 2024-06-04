import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class AttorneyDetails extends StatelessWidget {
  const AttorneyDetails({
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150.w,
                child: Text(
                  attorneyName ?? '',
                  style: style ?? Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                attorneyType ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textGrey500),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
