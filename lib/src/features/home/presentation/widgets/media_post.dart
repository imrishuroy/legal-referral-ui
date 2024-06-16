import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:video_player/video_player.dart';

class MediaPost extends StatefulWidget {
  const MediaPost({required this.mediaUrl, super.key});
  final String mediaUrl;
  @override
  State<MediaPost> createState() => _MediaPostState();
}

class _MediaPostState extends State<MediaPost> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.mediaUrl,
      ),
    )..initialize().then((_) {
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
                if (_controller.value.isPlaying)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.pause();
                      });
                    },
                  )
                else
                  GestureDetector(
                    onTap: () {
                    
                      setState(() {
                        _controller.play();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: LegalReferralColors.backgroundWhite255,
                          width: 2,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.play_arrow_outlined,
                          color: LegalReferralColors.backgroundWhite255,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
