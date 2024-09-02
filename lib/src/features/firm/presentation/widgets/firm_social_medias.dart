import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

class FirmSocialMedias extends StatefulWidget {
  const FirmSocialMedias({
    required this.firmBloc,
    super.key,
  });

  final FirmBloc firmBloc;

  @override
  State<FirmSocialMedias> createState() => _FirmSocialMediasState();
}

class _FirmSocialMediasState extends State<FirmSocialMedias> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirmBloc, FirmState>(
      bloc: widget.firmBloc,
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.socialMedias.length,
          itemBuilder: (context, index) {
            return SocialMediaField(
              firmBloc: widget.firmBloc,
              index: index,
            );
          },
        );
      },
    );
  }
}

class SocialMediaField extends StatefulWidget {
  const SocialMediaField({
    required this.firmBloc,
    required this.index,
    super.key,
  });

  final FirmBloc firmBloc;
  final int index;

  @override
  State<SocialMediaField> createState() => _SocialMediaFieldState();
}

class _SocialMediaFieldState extends State<SocialMediaField> {
  final _platformController = TextEditingController();
  final _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        CustomDropDown(
          items: SocialMediaConstants.socialMediaList,
          onChange: (value) {
            if (value != null) {
              _platformController.text = value;
              widget.firmBloc.add(
                SocialMediaPlatformSelected(
                  platform: _getSocialPlatform(value),
                  index: widget.index,
                ),
              );
            }
          },
          selectedValue: _platformController.text.isEmpty
              ? null
              : _platformController.text,
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
          validator: Validator.validateURL,
          onChanged: (value) {
            if (value != null && value.isNotEmpty) {
              widget.firmBloc.add(
                SocialLinkChanged(
                  url: value,
                  index: widget.index,
                ),
              );
            }
          },
        ),
        SizedBox(height: 16.h),
      ],
    );
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
        return SocialPlatform.none;
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
        return 'Social media link';
    }
  }

  @override
  void dispose() {
    _platformController.dispose();
    _linkController.dispose();
    super.dispose();
  }
}
