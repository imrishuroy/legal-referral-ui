import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/widgets/connections_dialog.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class DiscussionRoomPage extends StatelessWidget {
  const DiscussionRoomPage({required this.discussionTitle, super.key});
  final String discussionTitle;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Details',style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 24.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                color: LegalReferralColors.backgroundWhite255,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Topic',
                          style: textTheme.headlineSmall?.copyWith(
                            color: LegalReferralColors.textGrey400,
                          ),
                        ),
                        CustomTextButton(
                          onPressed: () {},
                          text: 'Edit',
                          style: textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textGrey400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      discussionTitle,
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                color: LegalReferralColors.backgroundWhite255,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '15 participants',
                      style: textTheme.headlineSmall
                          ?.copyWith(color: LegalReferralColors.textGrey400),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return const AttorneyDetails(
                          attorneyName: 'attorneyName',
                          attorneyType: 'attorneyType',
                          profileImage: null,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemCount: 15,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    HorizontalIconButton(
                      iconColor: LegalReferralColors.textBlue100,
                      style: textTheme.titleSmall
                          ?.copyWith(color: LegalReferralColors.textBlue100),
                      height: 20,
                      width: 20,
                      text: 'Invite Participants',
                      icon: IconStringConstants.addIcon,
                      onTap: () {
                        shareToConnections(context);
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    HorizontalIconButton(
                      iconColor: LegalReferralColors.textBlue100,
                      style: textTheme.titleSmall
                          ?.copyWith(color: LegalReferralColors.textBlue100),
                      width: 20,
                      height: 20,
                      text: 'Leave Discussion',
                      icon: IconStringConstants.subtract,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
