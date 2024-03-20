import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customButton.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      rawPages: listPagesViewModel,
      showSkipButton: false,
      showNextButton: false,
      showDoneButton: false,
      skip: const Text("Skip"),
      controlsPosition: const Position(left: 20, right: 200, bottom: 300),
      dotsDecorator: DotsDecorator(
        size: const Size(7, 7),
        color: Colors.grey,
        activeSize: const Size(22, 7),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        spacing: const EdgeInsets.symmetric(horizontal: 4),
        activeColor: Colors.blue,
      ),
    );
  }

  List<Widget>? listPagesViewModel = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Access attorneys nationwide across the USA'),
        const Text(
            'Effortlessly connect with attorneys across various practice areas spanning all states within the USA.'),
        Row(
          children: [
            Expanded(child: CustomButton(onTap: () {}, text: 'LOG IN')),
            Expanded(child: CustomButton(onTap: () {}, text: 'REGISTER')),
          ],
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Stay informed with the latest developments in legal news'),
        const Text(
            'Stay up to date with the latest developments in the legal landscape, news and updates to your field'),
        Row(
          children: [
            Expanded(child: CustomButton(onTap: () {}, text: 'LOG IN')),
            Expanded(child: CustomButton(onTap: () {}, text: 'REGISTER')),
          ],
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Access attorney referrals from across the entire USA'),
        const Text(
            'Obtain trusted referrals from an extensive network of attorneys spanning every region of the USA'),
        Row(
          children: [
            Expanded(child: CustomButton(onTap: () {}, text: 'LOG IN')),
            Expanded(child: CustomButton(onTap: () {}, text: 'REGISTER')),
          ],
        )
      ],
    ),
  ];
}
