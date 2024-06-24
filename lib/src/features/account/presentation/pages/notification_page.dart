import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        color: LegalReferralColors.backgroundWhite255,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(height: 8),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              title: Text(
                'Allow messaging notifications',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: CustomSwitch(
                onChanged: (bool? value) {},
                value: false,
              ),
            ),
            const Divider(
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              title: Text(
                'Messages',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const _MessageSettingPage(
                    title: 'Messaging',
                  ),
                ),
              ),
            ),
                const Divider(
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageSettingPage extends StatelessWidget {
  const _MessageSettingPage({required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        color: LegalReferralColors.backgroundWhite255,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(height: 8),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.h),
              child: Text(
                'These are notification letting '
                'you know you’ve received messages.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: LegalReferralColors.textGrey400),
              ),
            ),
            const Gap(height: 12),
            ListTile(
                  contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
              title: Text(
                'In-app notifications',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                'Delivered inside the app',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: LegalReferralColors.textGrey400),
              ),
              trailing: CustomSwitch(
                onChanged: (bool? value) {},
                value: false,
              ),
            ),
              const Divider(
                height: 8,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
            ListTile(
                  contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
              title: Text(
                'Push notification',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                'Pushed to your device immediately',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: LegalReferralColors.textGrey400),
              ),
              trailing: CustomSwitch(
                onChanged: (bool? value) {},
                value: false,
              ),
            ),
           const Divider(
            height: 8,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ],
        ),
      ),
    );
  }
}
