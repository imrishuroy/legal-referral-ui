import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/domain/entities/feed.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({super.key});
  static const String name = 'FeedsPage';

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  final _authBloc = getIt<AuthBloc>();
  final _feedBloc = getIt<FeedBloc>();
  final TextEditingController _searchController = TextEditingController();

  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _fetchFeeds();
    super.initState();
  }

  void _fetchFeeds() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _feedBloc.add(FeedsFetched(userId: userId));
    }
  }

  void _refreshFeed() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _feedBloc.add(FeedRefreshed(userId: userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => context.pushNamed(SearchPage.name),
                child: CustomTextField(
                  controller: _searchController,
                  enabled: false,
                  hintText: 'Search',
                  labelText: '',
                  showLabel: false,
                  borderColor: LegalReferralColors.borderGrey199,
                  fillColor: LegalReferralColors.containerWhite400,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            SvgButton(
              onPressed: () {},
              imagePath: IconStringConstants.bell,
              width: 24.w,
              height: 24.h,
            ),
          ],
        ),
        elevation: 0,
        leading: const FeedUserAvatar(),
      ),
      body: BlocConsumer<FeedBloc, FeedState>(
        bloc: _feedBloc,
        listener: (context, state) {
          if (state.status == FeedStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'Something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.status == FeedStatus.loading) {
            return const FeedShimmer();
          } else if (state.status == FeedStatus.success &&
              state.feeds.isEmpty) {
            return RefreshIndicator(
              color: LegalReferralColors.buttonPrimary,
              onRefresh: () async {
                _refreshFeed();
              },
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Text(
                    'No feeds available',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            );
          } else if (state.status == FeedStatus.success) {
            return RefreshIndicator(
              color: LegalReferralColors.buttonPrimary,
              onRefresh: () async {
                _refreshFeed();
              },
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index >= state.feeds.length) {
                          return const FeedShimmer();
                        }

                        final feed = state.feeds[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.h,
                          ),
                          child: FeedTile(
                            feed: feed,
                            isLiked: feed?.isLiked ?? false,
                            likesCount: feed?.likesCount ?? 0,
                            commentsCount: feed?.commentsCount ?? 0,
                            onLikePressed: () => _onLikePressed(
                              feed,
                              feed?.isLiked ?? false,
                              index,
                            ),
                            onCommentPressed: () {
                              if (feed != null) {
                                context.pushNamed(
                                  FeedDetailsPage.name,
                                  extra: FeedDetailsPageArgs(
                                    feedBloc: _feedBloc,
                                    feed: feed,
                                    index: index,
                                  ),
                                );
                              }
                            },
                            onSharePressed: () {},
                            onDiscussPressed: () {},
                          ),
                        );
                      },
                      childCount: state.hasReachedMax
                          ? state.feeds.length
                          : state.feeds.length + 1,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const FeedShimmer();
          }
        },
      ),
    );
  }

  void _onLikePressed(
    Feed? feed,
    bool isLiked,
    int index,
  ) {
    final postId = feed?.post?.postId;
    if (postId != null) {
      if (isLiked == true) {
        _feedBloc.add(
          PostUnliked(
            postId: postId,
            index: index,
          ),
        );
      } else {
        _feedBloc.add(
          PostLiked(
            postId: postId,
            index: index,
          ),
        );
      }
    }
  }

  void _onScroll() {
    if (_isBottom) {
      _fetchFeeds();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }
}
