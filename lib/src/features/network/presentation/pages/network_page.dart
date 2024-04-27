import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/image_string_constants.dart';
import 'package:legal_referral_ui/src/features/network/presentation/pages/connection_page.dart';
import 'package:legal_referral_ui/src/features/network/presentation/pages/invite_page.dart';
import 'package:legal_referral_ui/src/features/network/presentation/pages/recommendation_page.dart';
import 'package:legal_referral_ui/src/features/network/presentation/widgets/shimmers/network_shimmer.dart';

class NetworkPage extends StatelessWidget {
  NetworkPage({super.key});
  static const String name = 'networkPage';
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: CustomTextField(
                    controller: _search,
                    hintText: 'search',
                    labelText: '',
                    showLabel: false,
                    borderColor: LegalReferralColors.borderGrey199,
                    fillColor: LegalReferralColors.containerWhite400,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              SvgPicture.asset(
                ImageStringConstants.comment,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Invites',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  CustomTextButton(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    text: 'View All',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const InvitePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return const InviteShimmer();
                  // InviteCard();
                },
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    'Recommendation',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  CustomTextButton(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    text: 'View All',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RecommendationPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  mainAxisExtent: 226.h,

                  // childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return const RecommendationShimmer();
                  // RecommendationCard();
                },
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    'Connection',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  CustomTextButton(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    text: 'View All',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ConnectionPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                  color: LegalReferralColors.containerWhite500,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) => Column(
                    children: [
                      const ConnectionShimmer(),
                      // ConnectionListTile(),
                      Divider(
                        height: 0.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
