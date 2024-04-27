import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  static const name = 'OnBoardingScreen';

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      showNextButton: false,
      showDoneButton: false,
      onChange: (int index) {
        setState(() {
          currentPage = index;
        });
      },
      pages: [
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: Padding(
            padding: EdgeInsets.only(
              top: 70.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: SizedBox(
                    height: 262.h,
                    width: 226.w,
                    child: const OnBoardingImage(
                      assetName: 'on_boarding1.svg',
                    ),
                  ),
                ),
                SizedBox(height: 54.h),
                Text(
                  'Access attorneys nationwide across the USA',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Effortlessly connect with attorneys across various '
                  'practice areas spanning all states within the USA.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: Padding(
            padding: EdgeInsets.only(
              top: 70.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: SizedBox(
                    height: 262.h,
                    width: 226.w,
                    child: const OnBoardingImage(
                      assetName: 'on_boarding2.svg',
                    ),
                  ),
                ),
                SizedBox(height: 54.h),
                Text(
                  'Stay informed with the latest developments in legal news',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Stay up to date with the latest developments in the '
                  'legal landscape, news and updates to your field',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: Padding(
            padding: EdgeInsets.only(
              top: 70.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: SizedBox(
                    height: 262.h,
                    width: 226.w,
                    child: const OnBoardingImage(
                      assetName: 'on_boarding3.svg',
                    ),
                  ),
                ),
                SizedBox(height: 54.h),
                Text(
                  'Access attorney referrals from across the entire USA',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Obtain trusted referrals from an extensive network of '
                  'attorneys spanning every region of the USA',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      dotsDecorator: const DotsDecorator(
        size: Size.zero,
        activeSize: Size.zero,
      ),
      controlsPadding: EdgeInsets.only(
        top: 24.h,
        bottom: 24.h,
      ),
      globalFooter: Padding(
        padding: EdgeInsets.only(
          bottom: 20.h,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12.w,
                ),
                child: DotsIndicator(
                  mainAxisAlignment: MainAxisAlignment.start,
                  dotsCount: 3,
                  position: currentPage.toDouble(),
                  decorator: DotsDecorator(
                    activeSize: Size(22.w, 7.h),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    activeColor: const Color(0xff599ed9),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () async {
                      await SharedPrefs.setOnBoarding(onBoarding: true);
                      if (context.mounted) {
                        context.goNamed(
                          SignInPage.name,
                        );
                      }
                    },
                    text: 'LOG IN',
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () async {
                      await SharedPrefs.setOnBoarding(
                        onBoarding: true,
                      );
                      if (context.mounted) {
                        context.goNamed(
                          SignUpPage.name,
                        );
                      }
                    },
                    text: 'REGISTER',
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              onPressed: () async {
                await SharedPrefs.setOnBoarding(onBoarding: true);
                if (context.mounted) {
                  context.goNamed(
                    SignInPage.name,
                  );
                }
              },
              text: 'SKIP',
              fontSize: 14.h,
              fontWeight: FontWeight.w600,
              textColor: LegalReferralColors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({
    required this.assetName,
    this.width = 350,
    super.key,
  });

  final String assetName;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$assetName',
      width: width.w,
    );
  }
}

class OnBoardingFullImage extends StatelessWidget {
  const OnBoardingFullImage({
    required this.assetName,
    super.key,
  });

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
