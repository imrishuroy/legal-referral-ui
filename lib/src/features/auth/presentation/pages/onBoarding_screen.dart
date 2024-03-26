import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const name = 'OnBoardingScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      showNextButton: false,
      showDoneButton: false,
      onChange: (int index) {},
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
                  child: const SizedBox(
                    height: 262,
                    width: 226,
                    child: OnBoardingImage(
                      assetName: 'on_boarding1.svg',
                    ),
                  ),
                ),
                SizedBox(height: 54.h),
                const Text(
                  'Access attorneys nationwide across the USA',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                const Text(
                  'Effortlessly connect with attorneys across various '
                  'practice areas spanning all states within the USA.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
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
                  child: const SizedBox(
                    height: 262,
                    width: 226,
                    child: OnBoardingImage(
                      assetName: 'on_boarding2.svg',
                    ),
                  ),
                ),
                SizedBox(height: 54.h),
                const Text(
                  'Stay informed with the latest developments in legal news',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                const Text(
                  'Stay up to date with the latest developments in the '
                  'legal landscape, news and updates to your field',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
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
                  child: const SizedBox(
                    height: 262,
                    width: 226,
                    child: OnBoardingImage(
                      assetName: 'on_boarding3.svg',
                    ),
                  ),
                ),
                SizedBox(height: 54.h),
                const Text(
                  'Access attorney referrals from across the entire USA',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24.h),
                const Text(
                  'Obtain trusted referrals from an extensive network of '
                  'attorneys spanning every region of the USA',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      dotsDecorator: DotsDecorator(
        size: const Size(7, 7),
        activeSize: const Size(22, 7),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        activeColor: Colors.blue,
      ),
      controlsPadding: EdgeInsets.only(
        top: 24.h,
        bottom: 24.h,
      ),
      globalFooter: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
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
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
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
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () async {
                await SharedPrefs.setOnBoarding(onBoarding: true);
                if (context.mounted) {
                  context.goNamed(
                    SignInPage.name,
                  );
                }
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
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
      width: width,
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
