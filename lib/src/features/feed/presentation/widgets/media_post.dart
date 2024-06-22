import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/entities/post.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/presentation/widgets/widgets.dart';

class MediaPost extends StatelessWidget {
  const MediaPost({
    required this.mediaUrls,
    required this.postType,
    required this.imageHeight,
    this.fileName,
    super.key,
  });

  final String? fileName;
  final List<String?> mediaUrls;
  final PostType postType;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    if (postType == PostType.image) {
      return ImagePostWidget(
        imageUrls: mediaUrls,
        height: imageHeight,
      );
    } else if (postType == PostType.video && mediaUrls.isNotEmpty) {
      return SizedBox(
        height: imageHeight,
        child: VideoPost(
          videoUrl: mediaUrls.first,
        ),
      );
    } else if (postType == PostType.document && mediaUrls.isNotEmpty) {
      return DocumentPreview(
        docUrl: mediaUrls.first,
      );
    }

    return const SizedBox.shrink();
  }
}
