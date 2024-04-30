import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({
    required this.invitation,
    required this.onAccept,
    required this.onReject,
    super.key,
  });

  final ConnectionInvitation? invitation;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.08).withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        color: LegalReferralColors.containerWhite500,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: LegalReferralColors.borderGrey300,
                    width: 1.w,
                  ),
                ),
                child: CustomAvatar(
                  imageUrl: invitation?.avatarUrl,
                  radius: 25.r,
                ),
              ),
              SizedBox(
                width: 12.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${invitation?.firstName ?? ''} '
                    '${invitation?.lastName ?? ''}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    invitation?.about ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: LegalReferralColors.textGrey500,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Inviting you to connect',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: CustomOutlinedButton(
                    onPressed: onReject,
                    text: 'Reject',
                  ),
                ),
              ),
              SizedBox(
                width: 23.w,
              ),
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: CustomElevatedButton(
                    onTap: onAccept,
                    text: 'Accept',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
