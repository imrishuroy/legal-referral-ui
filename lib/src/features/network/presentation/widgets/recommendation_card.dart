import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    required this.recommendation,
    required this.onConnect,
    required this.onCancel,
    super.key,
  });

  final Recommendation? recommendation;
  final VoidCallback onConnect;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const textWhite450 = LegalReferralColors.textWhite450;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: CustomNetworkImage(
            imageUrl: recommendation?.avatarUrl,
            width: double.infinity,
            height: 226.h,
            placeholder: const AssetImage(
              IconStringConstants.avatarPlaceholder,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: onCancel,
                  child: SvgPicture.asset(
                    IconStringConstants.cross,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '${recommendation?.firstName ?? ''} '
                '${recommendation?.lastName ?? ''}',
                style: theme.textTheme.headlineSmall
                    ?.copyWith(color: textWhite450),
              ),
              Text(
                recommendation?.about ?? '',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: textWhite450,
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 36.h,
                child: CustomElevatedButton(
                  onTap: recommendation?.status !=
                          ConnectionInvitationStatus.pending
                      ? onConnect
                      : null,
                  text: recommendation?.status ==
                          ConnectionInvitationStatus.pending
                      ? 'Pending'
                      : 'Connect',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
