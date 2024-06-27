import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/widgets.dart';

class PreviewFirmPage extends StatelessWidget {
  const PreviewFirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: CustomTextButton(
              text: 'Edit',
              onPressed: () {},
              style: textTheme.bodyLarge,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HeaderSection(profileBloc: profileBloc, user: user, isCurrentUser: isCurrentUser),
            //firm meta data
            Container(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Davis Legal Group', style: textTheme.headlineMedium),
                  RichText(
                    text: TextSpan(
                      style: textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text: 'Public Company ',
                          style: textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textGrey400,
                          ),
                        ),
                        TextSpan(
                          text: '• Davislegalgroup.com ',
                          style: textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textBlue100,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Arizona',
                    style: textTheme.bodyLarge
                        ?.copyWith(color: LegalReferralColors.textGrey500),
                  ),
                ],
              ),
            ),
            CustomCard(
              onTap: () {},
              title: 'About',
              visibility: false,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Lorem proin at'
                ' et fermentum quis. Ornare eget eget metus fermentum'
                ' aenean. In aliquet fermentum donec interdum nec. Eget '
                'adipiscing leo nibh est feugiat nisi. Enim fermentum '
                'augue sit eget cursus ac donec dignissim consectetur.'
                ' Tortor duis sem convallis accumsan amet. Praesent '
                'laoreet dui fames sollicitudin elit quis. Lectus.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            //   ProfileSocialSection(
            //   profileBloc: _profileBloc,
            //   isCurrentUser: isCurrentUser,
            // ),
            const FeaturedSection(),
            CustomCard(
              onTap: () {},
              title: 'Activity',
              visibility: false,
              child: const ActivitySection(),
            ),
          ],
        ),
      ),
    );
  }
}
