import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/domain/entities/social.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ProfileSocialSection extends StatefulWidget {
  const ProfileSocialSection({
    required this.profileBloc,
    required this.isCurrentUser,
    super.key,
  });

  final ProfileBloc profileBloc;
  final bool isCurrentUser;

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
    return ProfileSection(
      title: 'Social',
      isCurrentUser: widget.isCurrentUser,
      showAddButton: true,
      showEditButton: true,
      onTapAdd: () => context.pushNamed(
        AddUpdateSocialPage.name,
        extra: AddUpdateSocialPageArgs(
          profileBloc: widget.profileBloc,
        ),
      ),
      onTapEdit: () => context.pushNamed(
        ListSocialPage.name,
        extra: widget.profileBloc,
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: widget.profileBloc,
        builder: (context, state) {
          return state.socialStatus == SocialStatus.loading
              ? const SocialShimmer()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.socials.length,
                  itemBuilder: (context, index) {
                    final social = state.socials[index];
                    return SocialTile(
                      social: social,
                    );
                  },
                );
        },
      ),
    );
  }
}
