import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/account/presentation/presentation.dart';

const List<String> _supportList = [
  'Frequently Asked Question',
  'Ask Us',
];

class SupportHelpPage extends StatelessWidget {
  const SupportHelpPage({super.key});

  static const String name = 'SupportHelpPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Support/Help',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        color: LegalReferralColors.backgroundWhite255,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            title: Text(
              _supportList[index],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              switch (index) {
                case 0:
                  context.pushNamed(FAQPage.name);

                  break;
                case 1:
                  context.pushNamed(AskUsPage.name);

                  break;
              }
            },
          ),
          separatorBuilder: (context, index) => Divider(
            height: 8.h,
          ),
          itemCount: _supportList.length,
        ),
      ),
    );
  }
}
