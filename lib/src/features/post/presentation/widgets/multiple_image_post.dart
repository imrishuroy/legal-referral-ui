import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';

class MultipleImagePost extends StatelessWidget {
  const MultipleImagePost({
    super.key,
    this.documentFile,
  });

  final List<File?>? documentFile;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: documentFile!.length,
      itemBuilder: (context, index) {
        final imageFile = documentFile;
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.file(
                  imageFile![index]!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: SvgButton(
                height: 20.h,
                width: 20.w,
                imagePath: IconStringConstants.cross,
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    );
  }
}
