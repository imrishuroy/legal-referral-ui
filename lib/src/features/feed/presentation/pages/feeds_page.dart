import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/domain/entities/feed.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/notifications/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';
import 'package:share_plus/share_plus.dart';
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
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  final _notificationUtil = getIt<LocalNotificationUtil>();

  @override
  void initState() {
    _fetchFeeds();
    _scrollController.addListener(_onScroll);

    _requestNotificationPermission();
    _saveDeviceDetails();

    FirebaseMessaging.instance.getInitialMessage().then((value) {
      AppLogger.info('getInitialMessage: $value');
    });

    /// Forground ( When the app is running in the forground )
    FirebaseMessaging.onMessage
        .listen(_notificationUtil.showFlutterNotification);

    /// When the app is running in the background but still open,
    /// and the user taps on it.
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      AppLogger.info('onMessageOpenedApp: $message');
    });

    super.initState();
  }

  Future<void> _requestNotificationPermission() async {
    final settings = await FirebaseMessaging.instance.requestPermission();
    AppLogger.info('settings: $settings');
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
              onPressed: () => context.pushNamed(NotificationsPage.name),
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
          _showFeedActionToastMessage(
            action: state.feedAction,
            status: state.feedActionStatus ?? FeedActionStatus.initial,
            ignoredFeed: state.ignoredFeed,
            ignoredFeedIndex: state.ignoredFeedIndex,
          );
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
                physics: const AlwaysScrollableScrollPhysics(),
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
              backgroundColor: Colors.white,
              onRefresh: () async {
                _refreshFeed();
              },
              child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.hasReachedMax
                    ? state.feeds.length
                    : state.feeds.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.feeds.length) {
                    return const FeedShimmer();
                  }

                  final feed = state.feeds[index];
                  final feedType = feed?.type;
                  if (feedType == FeedType.post) {
                    final post = feed?.post;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                      ),
                      child: FeedTile(
                        feed: feed,
                        isLiked: post?.isLiked ?? false,
                        likesCount: post?.likesCount ?? 0,
                        commentsCount: post?.commentsCount ?? 0,
                        onLikePressed: () => _onLikePressed(
                          post,
                          post?.isLiked ?? false,
                          index,
                        ),
                        onCommentPressed: () => _navigateToFeedDetailsPage(
                          feed,
                          index,
                        ),
                        onSharePressed: () async {
                          final files = post?.media;
                          if (files != null) {
                            await _sharePost(files);
                          }
                        },
                        onDiscussPressed: () => context.pushNamed(
                          CreateDiscussionPage.name,
                          pathParameters: {
                            'title': '${post?.content}',
                          },
                        ),
                        onTap: () => _navigateToFeedDetailsPage(
                          feed,
                          index,
                        ),
                        onOptionsPressed: () => _showPostOptionsSheet(
                          context: context,
                          feed: feed,
                          index: index,
                        ),
                      ),
                    );
                  } else {
                    return FeedAdTile(
                      ad: feed?.ad,
                    );
                  }
                },
              ),
            );
          } else {
            return const FeedShimmer();
          }
        },
      ),
    );
  }

  void _navigateToFeedDetailsPage(
    Feed? feed,
    int index,
  ) {
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
  }

  void _onLikePressed(
    Post? post,
    bool isLiked,
    int index,
  ) {
    final postId = post?.postId;
    if (postId != null) {
      if (isLiked == true) {
        _feedBloc.add(
          FeedPostUnliked(
            postId: postId,
            index: index,
            isFromeDetails: false,
          ),
        );
      } else {
        final senderId = _authBloc.state.user?.userId;
        final userId = post?.ownerId;
        final postId = post?.postId;
        if (userId != null && senderId != null && postId != null) {
          _feedBloc.add(
            FeedPostLiked(
              postId: postId,
              index: index,
              postOwnerId: userId,
              currentUserId: senderId,
              isFromeDetails: false,
            ),
          );
        }
      }
    }
  }

  void _showPostOptionsSheet({
    required BuildContext context,
    required Feed? feed,
    required int index,
  }) {
    final userId = _authBloc.state.user?.userId;
    CustomBottomSheet.show(
      isDismissible: true,
      borderRadius: true,
      maxWidth: double.infinity,
      context: context,
      child: FeedPostOptionsContent(
        feedBloc: _feedBloc,
        feed: feed,
        userId: userId,
        index: index,
      ),
    );
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
    return currentScroll >= (maxScroll * 0.8);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _saveDeviceDetails() async {
    final deviceId = await DeviceUtil.getId();
    final deviceToken = await FirebaseMessaging.instance.getToken();
    final userId = _authBloc.state.user?.userId;
    if (deviceId != null && deviceToken != null && userId != null) {
      final deviceDetails = DeviceDetails(
        deviceId: deviceId,
        deviceToken: deviceToken,
        userId: userId,
      );
      _authBloc.add(
        DeviceDetailsSaved(
          deviceDetails: deviceDetails,
        ),
      );
    }
  }

  Future<void> _sharePost(List<String> postFiles) async {
    final file = postFiles.isNotEmpty ? postFiles.first : '';
    await Share.share(
      'check out this post from Legal Referral app $file',
    );
  }

  void _showSuccessToast(String title, String description) {
    ToastUtil.showToast(
      context,
      title: title,
      description: description,
      type: ToastificationType.success,
    );
  }

  void _resetFeedAction() {
    Future.delayed(
      const Duration(seconds: 2),
      () => _feedBloc.add(FeedActionReseted()),
    );
  }

  void _showFeedActionToastMessage({
    required FeedAction action,
    required FeedActionStatus status,
    Feed? ignoredFeed,
    int? ignoredFeedIndex,
  }) {
    if (action == FeedAction.ignore) {
      ToastUtil.showUndoToast(
        context,
        title: 'Post hidden successfully.',
        type: ToastificationType.success,
        onUndo: () {
          if (ignoredFeed != null && ignoredFeedIndex != null) {
            _feedBloc.add(
              FeedPostIgnoreUndoed(
                index: ignoredFeedIndex,
                feed: ignoredFeed,
              ),
            );
          }
        },
      );
    } else if (status == FeedActionStatus.success) {
      switch (action) {
        case FeedAction.featured:
          _showSuccessToast('Success', 'Post featured successfully');
          break;
        case FeedAction.unfeatured:
          _showSuccessToast('Success', 'Post unfeatured successfully');
          break;
        case FeedAction.delete:
          _showSuccessToast('Success', 'Post deleted successfully');
          break;
        case FeedAction.save:
          _showSuccessToast('Success', 'Post saved successfully');
          break;
        case FeedAction.report:
          _showSuccessToast(
            'Success',
            "Thanks for reporting! We'll review the post",
          );
          break;
        default:
          break;
      }
      _resetFeedAction();
    } else if (status == FeedActionStatus.failure) {
      ToastUtil.showToast(
        context,
        title: 'Error',
        description: 'Something went wrong',
        type: ToastificationType.error,
      );
      _resetFeedAction();
    }
  }
}
