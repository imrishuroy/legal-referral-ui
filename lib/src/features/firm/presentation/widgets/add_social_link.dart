import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/social_constants.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

class AddSocialLink extends StatefulWidget {
  const AddSocialLink({super.key});

  @override
  State<AddSocialLink> createState() => _AddSocialLinkState();
}

class _AddSocialLinkState extends State<AddSocialLink> {
  final _platformController = TextEditingController();
  final _linkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(
          height: 12,
        ),
        CustomDropDown(
          items: SocialMediaConstants.socialMediaList,
          selectedValue:
              _platformController.text == '' ? null : _platformController.text,
          onChange: (value) {
            if (value != null) {
              _platformController.text = value;
            }
          },
          hintText: 'Select social media',
          labelText: 'Social Media',
          validator: (value) {
            if (value == null) {
              return 'Please select a social media';
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _linkController,
          hintText: _hintText(
            _getSocialPlatform(
              _platformController.text,
            ),
          ),
          labelText: 'Link',
          // validator: Validator.validateURL,
        ),
      ],
    );
  }
}

String _hintText(SocialPlatform platform) {
  switch (platform) {
    case SocialPlatform.facebook:
      return 'https://www.facebook.com';
    case SocialPlatform.twitter:
      return 'https://www.twitter.com';
    case SocialPlatform.instagram:
      return 'https://www.instagram.com';
    case SocialPlatform.linkedin:
      return 'https://www.linkedin.com';
    case SocialPlatform.snapchat:
      return 'https://www.snapchat.com';
    default:
      return '';
  }
}

SocialPlatform _getSocialPlatform(String platform) {
  switch (platform) {
    case 'Facebook':
      return SocialPlatform.facebook;
    case 'Twitter':
      return SocialPlatform.twitter;
    case 'Instagram':
      return SocialPlatform.instagram;
    case 'LinkedIn':
      return SocialPlatform.linkedin;
    default:
      return SocialPlatform.snapchat;
  }
}
