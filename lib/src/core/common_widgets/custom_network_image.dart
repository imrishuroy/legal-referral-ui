import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder,
    super.key,
  });

  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final ImageProvider? placeholder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 140.h,
      width: width ?? double.infinity,
      child: FadeInImage(
        placeholder: placeholder ??
            const AssetImage(
              IconStringConstants.imagePlaceholder,
            ),
        image: CachedNetworkImageProvider(
          imageUrl ?? '',
        ),
        fit: fit,
        height: height ?? 140.h,
        width: width ?? double.infinity,
        fadeInDuration: const Duration(
          milliseconds: 200,
        ),
        fadeOutDuration: const Duration(
          milliseconds: 100,
        ),
        imageErrorBuilder: (context, url, error) => Image.asset(
          IconStringConstants.imagePlaceholder,
          fit: fit,
          height: height ?? 140.h,
          width: width ?? double.infinity,
        ),
      ),
    );
  }
}
