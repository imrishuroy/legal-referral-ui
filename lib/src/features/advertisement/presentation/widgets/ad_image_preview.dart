import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class AdImagePreview extends StatefulWidget {
  const AdImagePreview({
    required this.imageFiles,
    this.height = 400,
    super.key,
  });

  final List<File> imageFiles;
  final double height;

  @override
  State<AdImagePreview> createState() => _AdImagePreviewState();
}

class _AdImagePreviewState extends State<AdImagePreview> {
  double _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final multipleImages = widget.imageFiles.length > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        if (widget.imageFiles.isNotEmpty)
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
            items: widget.imageFiles.map((file) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: multipleImages ? 12.w : 0.w,
                    ),
                    child: Image.file(
                      file,
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
        if (multipleImages)
          Center(
            child: DotsIndicator(
              position: _current,
              dotsCount: widget.imageFiles.length,
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
