import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AllActivitiesPage extends StatefulWidget {
  const AllActivitiesPage({
    required this.userId,
    required this.activityType,
    super.key,
  });
  static const String name = 'AllActivitiesPage';

  final String userId;
  final ActivityType activityType;

  @override
  State<AllActivitiesPage> createState() => _AllActivitiesPageState();
}

class _AllActivitiesPageState extends State<AllActivitiesPage> {
  final _profileBloc = getIt<ProfileBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _profileBloc.add(
      ActivityTypeChanged(
        activityType: widget.activityType,
        isFromAllActivities: true,
      ),
    );
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Activities'),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          if (state.activityStatus == ActivityStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    CustomOutlinedButton(
                      height: 35.h,
                      width: 76.w,
                      text: 'Posts',
                      onPressed: () => _profileBloc.add(
                        const ActivityTypeChanged(
                          activityType: ActivityType.post,
                          isFromAllActivities: true,
                        ),
                      ),
                      borderColor: state.activityType == ActivityType.post
                          ? LegalReferralColors.borderBlue
                          : LegalReferralColors.textGrey400,
                      textColor: state.activityType == ActivityType.post
                          ? LegalReferralColors.textBlue100
                          : LegalReferralColors.textGrey400,
                      borderRadius: 64,
                    ),
                    const SizedBox(width: 12),
                    CustomOutlinedButton(
                      height: 35.h,
                      width: 116.w,
                      text: 'Comments',
                      onPressed: () => _profileBloc.add(
                        const ActivityTypeChanged(
                          activityType: ActivityType.comment,
                          isFromAllActivities: true,
                        ),
                      ),
                      borderRadius: 64,
                      borderColor: state.activityType == ActivityType.comment
                          ? LegalReferralColors.borderBlue
                          : LegalReferralColors.textGrey400,
                      textColor: state.activityType == ActivityType.comment
                          ? LegalReferralColors.textBlue100
                          : LegalReferralColors.textGrey400,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              if (state.activityType == ActivityType.post)
                _AllActivitiesPosts(
                  state: state,
                  scrollController: _scrollController,
                  fetchPosts: _fetchPosts,
                )
              else
                _AllActivitiesComments(
                  state: state,
                  scrollController: _scrollController,
                  fetchComments: _fetchComments,
                ),
            ],
          );
        },
      ),
    );
  }

  void _fetchPosts() {
    _profileBloc.add(
      ActivityPostsFetched(
        userId: widget.userId,
        limit: 10,
      ),
    );
  }

  void _fetchComments() {
    _profileBloc.add(
      ActivityCommentsFetched(
        userId: widget.userId,
        limit: 10,
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      if (widget.activityType == ActivityType.post) {
        _fetchPosts();
      } else {
        _fetchComments();
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.8);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}

class _AllActivitiesPosts extends StatelessWidget {
  const _AllActivitiesPosts({
    required this.state,
    required this.scrollController,
    required this.fetchPosts,
  });

  final ProfileState state;
  final ScrollController scrollController;
  final VoidCallback fetchPosts;

  @override
  Widget build(BuildContext context) {
    return state.activityStatus == ActivityStatus.loading
        ? Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ActivityPostShimmer();
              },
            ),
          )
        : Expanded(
            child: RefreshIndicator(
              color: LegalReferralColors.buttonPrimary,
              onRefresh: () async {
                fetchPosts();
              },
              child: ListView.builder(
                controller: scrollController,
                itemCount: state.activityHasReachedMax
                    ? state.activityPosts.length
                    : state.activityPosts.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.activityPosts.length) {
                    return const ActivityPostShimmer();
                  }
                  final post = state.activityPosts[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                    ),
                    child: ActivityPostTile(
                      post: post,
                      isFromAllActivities: true,
                    ),
                  );
                },
              ),
            ),
          );
  }
}

class _AllActivitiesComments extends StatelessWidget {
  const _AllActivitiesComments({
    required this.state,
    required this.scrollController,
    required this.fetchComments,
  });

  final ProfileState state;
  final ScrollController scrollController;
  final VoidCallback fetchComments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        color: LegalReferralColors.containerWhite500,
        child: Column(
          children: [
            if (state.activityStatus == ActivityStatus.loading)
              Expanded(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: ActivityCommentShimmer(),
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: RefreshIndicator(
                  color: LegalReferralColors.buttonPrimary,
                  onRefresh: () async {
                    fetchComments();
                  },
                  child: ListView.separated(
                    controller: scrollController,
                    itemCount: state.activityHasReachedMax
                        ? state.activityComments.length
                        : state.activityComments.length + 1,
                    itemBuilder: (context, index) {
                      if (index >= state.activityComments.length) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: ActivityCommentShimmer(),
                        );
                      }
                      final comment = state.activityComments[index];
                      return ActivityCommentTile(
                        comment: comment,
                      );
                    },
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
