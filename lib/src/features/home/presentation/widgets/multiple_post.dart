import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/home/presentation/widgets/widgets.dart';

class MultiplePost extends StatefulWidget {
  const MultiplePost({super.key});

  @override
  State<MultiplePost> createState() => _MultiplePostState();
}

class _MultiplePostState extends State<MultiplePost> {
  double _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> images = [
    'https://via.placeholder.com/400x300',
    'https://via.placeholder.com/400x300',
    'https://via.placeholder.com/400x300',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        ExpandableText(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          text: lorem50,
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 340.h,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index.toDouble();
              });
            },
          ),
          items: images.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 340.w,
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 8.h,
        ),
        Center(
          child: DotsIndicator(
            position: _current,
            dotsCount: images.length,
            decorator: DotsDecorator(
              activeSize: Size(22.w, 7.h),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              activeColor: LegalReferralColors.containerBlue100,
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    super.key,
  });
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          disabledColor: Colors.transparent,
          icon: Icon(icon),
          onPressed: onPressed,
        ),
        Text(text),
      ],
    );
  }
}

const String lorem50 =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Sed do eiusmod tempor incididunt ut labore et  aliqua. '
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco '
    'nisi ut aliquip ex ea commodo consequat. Duis aute irure  '
    'reprehenderit in voluptate velit esse cillum dolore eu '
    'pariatur. Excepteur sint occaecat cupidatat non proident,  '
    'qui officia deserunt mollit anim id est laborum.';
