import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/notification_label.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/account/presentation/pages/my_law_firm_page.dart';
import 'package:legal_referral_ui/src/features/account/presentation/pages/notification_page.dart';
import 'package:legal_referral_ui/src/features/account/presentation/pages/saved_post_page.dart';
import 'package:legal_referral_ui/src/features/account/presentation/pages/signin_security_page.dart';
import 'package:legal_referral_ui/src/features/account/presentation/pages/support_help_page.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/pages/ad_status_page.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => LogoutManager.performLogout(),
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: LegalReferralColors.primaryBackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAvatar(
                    imageUrl: null,
                    radius: 78.r,
                  ),
                  const Gap(height: 16),
                  Text(
                    '${'user?.firstName'} '
                    '${'user?.lastName'}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'user?.practiceArea',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: LegalReferralColors.textGrey400,
                        ),
                  ),
                  const Gap(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconStringConstants.favIcon,
                      ),
                      Text(
                        '4.3 by 433 attorneys',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: LegalReferralColors.textGrey400,
                            ),
                      ),
                    ],
                  ),
                  const Gap(height: 8),
                  Text(
                    '898 Followers • 233 Connections',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: LegalReferralColors.textBlue100,
                        ),
                  ),
                  const Gap(height: 24),
                ],
              ),
            ),
            ColoredBox(
              color: LegalReferralColors.backgroundWhite255,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  title: Text(
                    title[index],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onTap: () {
                    switch (index) {
                      // My Law Firm Page
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyLawFirmPage(title: title[index]),
                          ),
                        );
                        break;
                      // Saved Posts
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SavedPostPage(title: title[index]),
                          ),
                        );
                        break;
                      // Sign in & Security
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SignInSecurityPage(title: title[index]),
                          ),
                        );
                        break;
                      // Post an Advertisement
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AdStatusPage(title: title[index]),
                          ),
                        );
                        break;
                      // Notification
                      case 4:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationSettingPage(
                              title: title[index],
                            ),
                          ),
                        );
                        break;
                      // Support/Help
                      case 5:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SupportHelpPage(title: title[index]),
                          ),
                        );
                        break;
                    }
                  },
                  trailing: const NotificationLabel(notificationNum: '2'),
                ),
                separatorBuilder: (context, index) => Divider(
                  height: 4.h,
                  color: const Color(0x18000000),
                ),
                itemCount: title.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> title = [
    'My Law Firm Page',
    'Saved Posts',
    'Sign in & Security',
    'Post an Advertisement',
    'Notification',
    'Support/Help',
  ];
}
