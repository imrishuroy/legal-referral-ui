import 'dart:io';

import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

class CreatePostReq {
  CreatePostReq({
    required this.ownerId,
    required this.content,
    required this.type,
    required this.files,
    this.pollTitle,
    this.pollOptions,
  });

  final String ownerId;
  final String content;
  final PostType type;
  final List<File> files;
  final String? pollTitle;
  final List<String>? pollOptions;
}
