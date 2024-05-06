import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
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
                  IconStringConstants.editIcon,
                ),
              ),
            )
          : null,
    );
  }

  String _socialIcon(SocialPlatform? platform) {
    switch (platform) {
      case SocialPlatform.linkedin:
        return IconStringConstants.linkedin;
      case SocialPlatform.twitter:
        return IconStringConstants.twitter;
      case SocialPlatform.facebook:
        return IconStringConstants.facebook;
      case SocialPlatform.instagram:
        return IconStringConstants.instagram;
      case SocialPlatform.snapchat:
        return IconStringConstants.snapchat;
      default:
        return IconStringConstants.favIcon;
    }
  }

  Future<void> _launchURL(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw 'Could not launch $url';
    }
  }
}
