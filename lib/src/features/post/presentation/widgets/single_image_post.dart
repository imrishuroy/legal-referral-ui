import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/post/presentation/bloc/post_bloc.dart';

class SingleImagePost extends StatelessWidget {
  const SingleImagePost({
    required PostBloc postBloc,
    super.key,
    this.filePath,
  }) : _postBloc = postBloc;

  final PostBloc _postBloc;
  final File? filePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: filePath == null
          ? const SizedBox.shrink()
          : Stack(
              children: [
                Image.file(
                  filePath!,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: SvgButton(
                    height: 20.h,
                    width: 20.w,
                    imagePath: IconStringConstants.cross,
                    onPressed: () {
                      if (filePath != null) {
                        _postBloc.add(const RemovedFile());
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
