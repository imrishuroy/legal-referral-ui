import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class PreviewVideo extends StatelessWidget {
  const PreviewVideo({
    required this.videoUrl,
    required this.height,
    required this.width,
    super.key,
  });

  final String? videoUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: videoUrl == null
          ? const Center(
              child: Icon(Icons.info),
            )
          : FutureBuilder<Uint8List?>(
              future: VideoThumbnail.thumbnailData(
                video: videoUrl!,
                imageFormat: ImageFormat.JPEG,
                quality: 25,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoadingIndicator(
                    lineWidth: 2,
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error loading video'),
                  );
                }
                if (snapshot.hasData) {
                  return Image.memory(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
    );
  }
}
