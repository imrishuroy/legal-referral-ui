import 'dart:io';

import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

class CreatePostReq {
  CreatePostReq({
    required this.ownerId,
    required this.title,
    required this.content,
    required this.type,
    required this.files,
    required this.pollTitle,
    required this.pollOptions,
  });

  final String ownerId;
  final String title;
  final String content;
  final PostType type;
  final List<File> files;
  final String? pollTitle;
  final List<String>? pollOptions;
}
