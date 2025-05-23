import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';

class MediaPost extends StatelessWidget {
  const MediaPost({
    required this.mediaUrls,
    required this.postType,
    required this.postHeight,
    this.fileName,
    super.key,
  });

  final String? fileName;
  final List<String?> mediaUrls;
  final PostType postType;
  final double postHeight;

  @override
  Widget build(BuildContext context) {
    if (postType == PostType.image) {
      return ImagePostWidget(
        imageUrls: mediaUrls,
        height: postHeight,
      );
    } else if (postType == PostType.video && mediaUrls.isNotEmpty) {
      return SizedBox(
        height: postHeight,
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
