// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_switch.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/custom_card.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  bool _showMoreText = true;

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
                title: 'Case resolution rate',
                child: Text(
                  '71%',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              CustomCard(
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
                title: 'Social',
                child: Column(
                  children: [
                    // this will be generating dynamically list based on User
                    // wraping in listview.builder
                    Row(
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: SvgPicture.asset(ImageStringsUtil.facebook),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Barry.E123',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: LegalReferralColors.textBlue100,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomCard(
                title: 'Featured',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(8), // Adjust the radius as needed
                    border: Border.all(
                      color: LegalReferralColors
                          .borderLightGrey300, // Border color
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Text(
                          'post'.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: LegalReferralColors.textGrey400,
                                  ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 212.h,
                        width: 253.w,
                        child: Image.asset(
                          'assets/tempImages/Frame 202.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Text(
                          'Guidelines to file bankruptcy',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Text(
                          'Lorem ipsum dolor sit amet',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: LegalReferralColors.textGrey400,
                                  ),
                        ),
                      ),
                      SizedBox(height: 19.h),
                    ],
                  ),
                ),
              ),
              CustomCard(
                title: 'Activity',
                child: Column(
                  children: [
                    const Text('898 Followers'),
                    CustomOutlinedButton(
                      text: 'Posts',
                      onPressed: () {},
                      borderRadius: 64,
                    ),
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
                          child: CircleAvatar(
                            radius: 27.r,
                            backgroundImage: const AssetImage(
                              'assets/tempImages/Ellipse 38.png',
                            ),
                          ),
                        ),
                        const Column(
                          children: [
                            Text('Barry E. Janay'),
                            Text('Founder, ONYX • 2nd'),
                            Text('13 min ago'),
                          ],
                        ),
                        SvgPicture.asset(ImageStringsUtil.threeDots),
                      ],
                    ),
                    Text(
                      'Nam pellentesque magna ac ex convallis ullamcorper.'
                      ' Mauris iaculis semper malesuada. '
                      'Donec mi massa, '
                      'iaculis non porttitor ut,'
                      ' volutpat nec arcu. Fusce quis finibus felis',
                      // Display only 4 lines initially
                      maxLines: _showMoreText ? null : 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    CustomTextButton(
                      onPressed: () {
                        _showMoreText = true;
                      },
                      text: !_showMoreText ? 'Read more...' : '\nShow less...',
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImageStringsUtil.thumbUp,
                              height: 12.h,
                              width: 12.w,
                            ),
                            const Text('21 Likes'),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImageStringsUtil.comment,
                              height: 12.h,
                              width: 12.w,
                            ),
                            const Text('Comments'),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              ImageStringsUtil.thumbUp,
                            ),
                            const Text('Like'),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              ImageStringsUtil.comment,
                            ),
                            const Text('Comment'),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              ImageStringsUtil.discuss,
                            ),
                            const Text('Discuss'),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              ImageStringsUtil.share,
                            ),
                            const Text('Share'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/tempImages/Likes.png',
                        ),
                        Column(
                          children: [
                            Container(
                              width: 295.w,
                              color: LegalReferralColors.containerWhite400,
                              child: const Column(
                                children: [
                                  Text('Sinan Rakib • 1st'),
                                  Text('Finance attorney'),
                                  Text(
                                    'Lorem ipsum dolor sit amet consectetur.'
                                    ' Risus lectus sit maecenas et.'
                                    ' Adipiscing viverra ac risus blandit'
                                    ' dignissim condimentum gravida.',
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImageStringsUtil.thumbUp,
                                      height: 16.h,
                                      width: 16.w,
                                    ),
                                    const Text('Like •4'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImageStringsUtil.reply,
                                      height: 16.h,
                                      width: 16.w,
                                    ),
                                    const Text('Reply'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.w,
                    ),
                    CustomOutlinedButton(
                      onPressed: () {},
                      text: 'See All Posts',
                    ),
                  ],
                ),
              ),
              const CustomCard(
                title: 'Experience',
              ),
              const CustomCard(
                title: 'Education',
              ),
              const CustomCard(
                title: 'Review',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
