import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/pages/create_ad_page.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/widgets/renew_ad_tile.dart';

class AdStatusPage extends StatelessWidget {
  const AdStatusPage({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    const noScroll = NeverScrollableScrollPhysics();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        //display icon only when DB.data.isNotEmpty
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: SvgButton(
              height: 24.h,
              width: 24.w,
              color: LegalReferralColors.borderBlue100,
              imagePath: IconStringConstants.addIcon,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateAdPage()),
                );
              },
            ),
          ),
        ],
        elevation: 1,
        title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ),
      body:
          // when DB has some list of Ad
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Playing Ad',
                style: textTheme.headlineMedium,
              ),
            ),
            const Gap(height: 12),
            ListView.builder(
              physics: noScroll,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return const RenewAdTile(buttonText: 'Extend Ad period');
              },
              itemCount: 2,
            ),
            const Gap(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Your Ads',
                style: textTheme.headlineMedium,
              ),
            ),
            const Gap(height: 12),
            ListView.builder(
              physics: noScroll,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return const RenewAdTile(buttonText: 'Renew Ad');
              },
              itemCount: 2,
            ),
          ],
        ),
      ),
      // initial page if no add in DB
      //  const AdPostInitial(),
    );
  }
}
