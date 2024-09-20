import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class ImagePostWidget extends StatefulWidget {
  const ImagePostWidget({
    required this.imageUrls,
    this.height = 400,
    super.key,
  });

  final List<String?> imageUrls;
  final double height;

  @override
  State<ImagePostWidget> createState() => _ImagePostWidgetState();
}

class _ImagePostWidgetState extends State<ImagePostWidget> {
  double _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final multipleImages = widget.imageUrls.length > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        if (widget.imageUrls.isNotEmpty)
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: widget.height.h,
              enableInfiniteScroll: multipleImages,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index.toDouble();
                });
              },
            ),
            items: widget.imageUrls.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: multipleImages ? 12.w : 0.w,
                    ),
                    child: CustomNetworkImage(
                      imageUrl: imageUrl,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        SizedBox(
          height: 8.h,
        ),
        if (multipleImages)
          Center(
            child: DotsIndicator(
              position: _current,
              dotsCount: widget.imageUrls.length,
              decorator: DotsDecorator(
                activeSize: const Size(20, 7),
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
