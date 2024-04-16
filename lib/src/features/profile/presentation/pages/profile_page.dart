// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_switch.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/add_education_page.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/add_pricing_page.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/add_social_page.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/activity_widget.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/custom_card.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/education_widget.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/experience_widget.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/feature_widget.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/review_widget.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/social_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String name = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              ColoredBox(
                color: LegalReferralColors.containerWhite500,
                child: Column(
                  children: [
                    SizedBox(
                      height: 220.h,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 140.h,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/tempImages/Banner.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            right: 16.w,
                            top: 148.h,
                            child: CustomIconButton(
                              onTap: () => context.pushNamed(
                                UpdateUserInfoPage.name,
                              ),
                              icon: SvgPicture.asset(ImageStringsUtil.editIcon),
                            ),
                          ),
                          Positioned(
                            top: 61.h,
                            left: 16.w,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: LegalReferralColors.containerWhite500,
                                  width: 2.w,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 78.r,
                                backgroundImage: const AssetImage(
                                  'assets/tempImages/Ellipse 38.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Barry E. Janay',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            'Corporate Attorney',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: LegalReferralColors.textGrey400,
                                    ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                ImageStringsUtil.favIcon,
                              ),
                              Text(
                                '4.3 by 433 attorneys',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: LegalReferralColors.textGrey400,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            '898 Followers • 233 Connections',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: LegalReferralColors.textBlue100,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddPricePage()),
                  );
                },
                title: 'Pricing',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: r'$50',
                        style: Theme.of(context).textTheme.displaySmall,
                        children: <TextSpan>[
                          TextSpan(
                            text: '/hr',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Open to refer',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        const CustomSwitch(
                          value: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddPricePage()),
                  );
                },
                title: 'Average billing per client',
                child: Text.rich(
                  TextSpan(
                    text: r'$30,000',
                    style: Theme.of(context).textTheme.displaySmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: '/hr',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              CustomCard(
                onTap: () {},
                title: 'Case resolution rate',
                child: Text(
                  '71%',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              CustomCard(
                onTap: () {},
                title: 'About',
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur.'
                  ' Lorem proin at et fermentum quis. '
                  'Ornare eget eget metus fermentum aenean. '
                  'In aliquet fermentum donec interdum nec. '
                  'Eget adipiscing leo nibh est feugiat nisi. '
                  'Enim fermentum augue sit eget cursus ac donec '
                  'dignissim consectetur. '
                  'Tortor duis sem convallis accumsan amet. '
                  'Praesent laoreet dui fames sollicitudin elit quis.'
                  ' Lectus.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              CustomCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddSocialPage(),
                    ),
                  );
                },
                title: 'Social',
                child: const SocialWidget(),
              ),
              CustomCard(
                onTap: () {},
                title: 'Featured',
                visibility: false,
                child: SizedBox(
                  height: 330.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) => SizedBox(
                      width: 253.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: const FeaturedWidget(),
                      ),
                    ),
                  ),
                ),
              ),
              CustomCard(
                onTap: () {},
                title: 'Activity',
                visibility: false,
                child: const ActivityWidget(),
              ),
              ProfileSection(
                title: 'Experience',
                actions: [
                  CustomIconButton(
                    onTap: () => context.pushNamed(AddExperiencePage.name),
                    icon: SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: SvgPicture.asset(ImageStringsUtil.addIcon),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomIconButton(
                    onTap: () {},
                    icon: SizedBox(
                      height: 18.h,
                      width: 18.w,
                      child: SvgPicture.asset(ImageStringsUtil.editIcon),
                    ),
                  ),
                ],
                child: const ExperienceWidget(),
              ),

              ProfileSection(
                title: 'Education',
                actions: [
                  CustomIconButton(
                    onTap: () => context.pushNamed(AddEducationPage.name),
                    icon: SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: SvgPicture.asset(ImageStringsUtil.addIcon),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomIconButton(
                    onTap: () {},
                    icon: SizedBox(
                      height: 18.h,
                      width: 18.w,
                      child: SvgPicture.asset(ImageStringsUtil.editIcon),
                    ),
                  ),
                ],
                child: const EducationWidget(),
              ),
              // CustomCard(
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => const AddExperiencePage(),
              //       ),
              //     );
              //   },
              //   title: 'Experience',
              //   child: const ExperienceWidget(),
              // ),
              // CustomCard(
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => const AddEducationPage(),
              //       ),
              //     );
              //   },
              //   title: 'Education',
              //   child: const EducationWidget(),
              // ),
              CustomCard(
                onTap: () {},
                title: 'Review',
                visibility: false,
                child: SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) => SizedBox(
                      width: 318.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: const ReviewWidget(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
