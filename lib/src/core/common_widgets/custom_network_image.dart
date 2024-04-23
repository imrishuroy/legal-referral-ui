import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    required this.height,
    required this.width,
    super.key,
  });

  final String? imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      width: double.infinity,
      child: FadeInImage(
        placeholder: const AssetImage(
          ImageStringsConstants.imagePlaceholder,
        ),
        image: CachedNetworkImageProvider(
          imageUrl ?? '',
        ),
        fit: BoxFit.cover,
        height: 140.h,
        width: double.infinity,
        fadeInDuration: const Duration(
          milliseconds: 300,
        ),
        fadeOutDuration: const Duration(
          milliseconds: 100,
        ),
        imageErrorBuilder: (context, url, error) => Image.asset(
          ImageStringsConstants.imagePlaceholder,
          fit: BoxFit.cover,
          height: 140.h,
          width: double.infinity,
        ),
      ),
    );
  }
}
