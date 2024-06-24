import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({
    this.videoUrl,
    this.file,
    super.key,
  });
  final String? videoUrl;
  final File? file;
  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.file != null) {
      _controller = VideoPlayerController.file(widget.file!);
    } else if (widget.videoUrl != null) {
      _controller =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!));
    } else {
      throw ArgumentError('Either file or videoUrl must be provided.');
    }

    _controller.initialize().then((_) {
      setState(() {});
    });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        setState(() {
          _controller.seekTo(Duration.zero);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: _controller.value.isInitialized
          ? Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                if (!_controller.value.isPlaying)
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Container(color: Colors.black.withOpacity(0.6)),
                  ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow_outlined,
                        color: LegalReferralColors.backgroundWhite255,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CustomLoadingIndicator(
                lineWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
