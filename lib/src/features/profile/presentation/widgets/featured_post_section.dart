import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/feature_widget.dart';

class FeaturedPostsSection extends StatefulWidget {
  const FeaturedPostsSection({super.key});

  @override
  State<FeaturedPostsSection> createState() => _FeaturedPostsSectionState();
}

class _FeaturedPostsSectionState extends State<FeaturedPostsSection> {
  final _authBloc = getIt<AuthBloc>();
  final _profileBloc = getIt<ProfileBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _profileBloc.add(FeaturePostsFetched(userId: userId));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {},
      title: 'Featured',
      visibility: false,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        builder: (context, state) {
          if (state.profileStatus == ProfileStatus.loading) {
            return const FeaturedPostsShimmer();
          }
          final featurePosts = state.featurePosts;
          if (featurePosts.isEmpty) {
            return Text(
              'No featured posts',
              style: Theme.of(context).textTheme.bodyMedium,
            );
          }
          return SizedBox(
            height: 308.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: featurePosts.length,
              itemBuilder: (context, index) => SizedBox(
                width: 253.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: FeaturedWidget(
                    post: featurePosts[index].post,
                    onUnSave: () {
                      _profileBloc.add(
                        FeaturePostUnsaved(
                          postId: featurePosts[index].post!.postId,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
