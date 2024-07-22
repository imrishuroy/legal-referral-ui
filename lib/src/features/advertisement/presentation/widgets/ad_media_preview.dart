import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';

class AdMediaPreview extends StatelessWidget {
  const AdMediaPreview({
    required this.files,
    required this.adType,
    super.key,
  });

  final List<File> files;

  final AdType adType;

  @override
  Widget build(BuildContext context) {
    if (adType == AdType.image) {
      return AdImagePreview(
        imageFiles: files,
      );
    } else if (adType == AdType.video && files.isNotEmpty) {
      return SizedBox(
        height: 400.h,
        child: VideoPost(
          file: files.first,
        ),
      );
    }

    return const SizedBox();
  }
}
