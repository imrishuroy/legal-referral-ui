import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/domain/entities/social.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialTile extends StatelessWidget {
  const SocialTile({
    required this.social,
    this.onEdit,
    super.key,
  });

  final Social? social;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -4),
      leading: SvgPicture.asset(
        _socialIcon(
          social?.platform,
        ),
        width: 24.w,
        height: 24.h,
      ),
      onTap: () => social?.link != null ? _launchURL(social!.link) : null,
      title: Text(
        social?.link ?? '--',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
      trailing: onEdit != null
          ? GestureDetector(
              onTap: onEdit,
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(
                  ImageStringsConstants.editIcon,
                ),
              ),
            )
          : null,
    );
  }

  String _socialIcon(SocialPlatform? platform) {
    switch (platform) {
      case SocialPlatform.linkedin:
        return ImageStringsConstants.linkedin;
      case SocialPlatform.twitter:
        return ImageStringsConstants.twitter;
      case SocialPlatform.facebook:
        return ImageStringsConstants.facebook;
      case SocialPlatform.instagram:
        return ImageStringsConstants.instagram;
      case SocialPlatform.snapchat:
        return ImageStringsConstants.snapchat;
      default:
        return ImageStringsConstants.favIcon;
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
