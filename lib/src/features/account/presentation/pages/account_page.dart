import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/account/presentation/pages/signin_security_page.dart';
import 'package:legal_referral_ui/src/features/account/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/saved_posts/presentation/presentation.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  static const String name = 'AccountPage';

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
            const AccountInfoSection(),
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
                    _accountSection[index],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onTap: () {
                    switch (index) {
                      // My Law Firm Page
                      case 0:
                        context.pushNamed(MyLawFirmPage.name);

                        break;
                      // Saved Posts
                      case 1:
                        context.pushNamed(SavedPostsPage.name);

                        break;
                      // Sign in & Security
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInSecurityPage(
                              title: _accountSection[index],
                            ),
                          ),
                        );
                        break;

                      case 3:
                        context.pushNamed(AdPage.name);
                        break;
                      // Notification
                      case 4:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationSettingPage(
                              title: _accountSection[index],
                            ),
                          ),
                        );
                        break;
                      // Support/Help
                      case 5:
                        context.pushNamed(SupportHelpPage.name);
                        break;
                    }
                  },
                  trailing: const NotificationLabel(notificationNum: '2'),
                ),
                separatorBuilder: (context, index) => Divider(
                  height: 4.h,
                  color: const Color(0x18000000),
                ),
                itemCount: _accountSection.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> _accountSection = [
    'My Law Firm Page',
    'Saved Posts',
    'Sign in & Security',
    'Post an Advertisement',
    'Notification',
    'Support/Help',
  ];
}
