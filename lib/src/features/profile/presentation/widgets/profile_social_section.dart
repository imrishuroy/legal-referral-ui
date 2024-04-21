import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/domain/entities/social.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSocialSection extends StatefulWidget {
  const ProfileSocialSection({
    required this.profileBloc,
    super.key,
  });

  final ProfileBloc profileBloc;

  @override
  State<ProfileSocialSection> createState() => _ProfileSocialSectionState();
}

class _ProfileSocialSectionState extends State<ProfileSocialSection> {
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      widget.profileBloc.add(
        SocialsFetched(
          entityType: EntityType.user,
          entityId: userId,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: widget.profileBloc,
      builder: (context, state) {
        return state.socialStatus == SocialStatus.loading
            ? const CustomLoadingIndicator()
            : ProfileSection(
                title: 'Social',
                actions: [
                  CustomIconButton(
                    onTap: () => context.pushNamed(
                      AddUpdateSocialPage.name,
                      extra: AddUpdateSocialPageArg(
                        profileBloc: widget.profileBloc,
                      ),
                    ),
                    icon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(ImageStringsUtil.addIcon),
                    ),
                  ),
                ],
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.socials.length,
                  itemBuilder: (context, index) {
                    final social = state.socials[index];
                    return SocialTile(
                      social: social,
                      onEdit: () => context.pushNamed(
                        AddUpdateSocialPage.name,
                        extra: AddUpdateSocialPageArg(
                          social: social,
                          profileBloc: widget.profileBloc,
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}

class SocialTile extends StatelessWidget {
  const SocialTile({
    required this.social,
    required this.onEdit,
    super.key,
  });

  final Social? social;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        _socialIcon(
          social?.platform,
        ),
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
      trailing: GestureDetector(
        onTap: onEdit,
        child: SizedBox(
          width: 16.w,
          height: 16.h,
          child: SvgPicture.asset(
            ImageStringsUtil.editIcon,
            width: 16.w,
            height: 16.h,
          ),
        ),
      ),
    );
  }

  String _socialIcon(SocialPlatform? platform) {
    switch (platform) {
      case SocialPlatform.linkedin:
        return ImageStringsUtil.linkedin;
      case SocialPlatform.twitter:
        return ImageStringsUtil.twitter;
      case SocialPlatform.facebook:
        return ImageStringsUtil.facebook;
      case SocialPlatform.instagram:
        return ImageStringsUtil.instagram;
      case SocialPlatform.snapchat:
        return ImageStringsUtil.snapchat;
      default:
        return ImageStringsUtil.favIcon;
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
