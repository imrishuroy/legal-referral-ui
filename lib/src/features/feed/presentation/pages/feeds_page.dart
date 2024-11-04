import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/domain/entities/feed.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/notifications/presentation/presentation.dart';
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
    _requestNotificationPermission();
    _scrollController.addListener(_onScroll);
    _fetchFeeds();
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
          if (state.feedActionsStatus == FeedActionsStatus.success) {
            ToastUtil.showToast(
              context,
              title: 'Success',
              description: 'Post saved successfully',
              type: ToastificationType.success,
            );
          } else if (state.status == FeedStatus.failure ||
              state.feedActionsStatus == FeedActionsStatus.failure) {
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
              child: ListView.builder(
                controller: _scrollController,
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
                    final feedPost = feed?.feedPost;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                      ),
                      child: FeedTile(
                        feed: feed,
                        isLiked: feedPost?.isLiked ?? false,
                        likesCount: feedPost?.likesCount ?? 0,
                        commentsCount: feedPost?.commentsCount ?? 0,
                        onLikePressed: () => _onLikePressed(
                          feedPost,
                          feedPost?.isLiked ?? false,
                          index,
                        ),
                        onCommentPressed: () => _navigateToFeedDetailsPage(
                          feed,
                          index,
                        ),
                        onSharePressed: () async {
                          final files = feedPost?.media;
                          if (files != null) {
                            await _sharePost(files);
                          }
                        },
                        onDiscussPressed: () {},
                        onTap: () => _navigateToFeedDetailsPage(
                          feed,
                          index,
                        ),
                        onOptionsPressed: () => _showPostOptionsSheet(
                          context: context,
                          feed: feed,
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

  Future<void> _sharePost(List<String> postFiles) async {
    final file = postFiles.isNotEmpty ? postFiles.first : '';
    await Share.share(
      'check out this post from Legal Referral app $file',
    );
  }

  void _onLikePressed(
    FeedPost? feedPost,
    bool isLiked,
    int index,
  ) {
    final postId = feedPost?.postId;
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
        final userId = feedPost?.ownerId;
        final postId = feedPost?.postId;
        if (userId != null && senderId != null && postId != null) {
          _feedBloc.add(
            FeedPostLiked(
              postId: postId,
              index: index,
              userId: userId,
              senderId: senderId,
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
  }) {
    final userId = _authBloc.state.user?.userId;
    CustomBottomSheet.show(
      isDismissible: true,
      borderRadius: true,
      maxWidth: double.infinity,
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              final postId = feed?.feedPost?.postId;
              if (postId != null && userId != null) {
                _feedBloc.add(
                  PostSaved(
                    postId: postId,
                    userId: userId,
                  ),
                );
                context.pop();
              }
            },
            leading: SvgPicture.asset(IconStringConstants.download),
            title: Text(
              'Save',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: LegalReferralColors.textGrey500),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(IconStringConstants.message),
            title: Text(
              'Message',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: LegalReferralColors.textGrey500),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(IconStringConstants.addFollow),
            title: Text(
              'Follow',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: LegalReferralColors.textGrey500),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () async {
              await _sharePost(feed?.feedPost?.media ?? []);
            },
            leading: SvgPicture.asset(
              IconStringConstants.share,
              colorFilter: const ColorFilter.mode(
                LegalReferralColors.borderBlue100,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              'Share via',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: LegalReferralColors.textGrey500),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(IconStringConstants.restrict),
            title: Text(
              '''I don't want to see this''',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: LegalReferralColors.textGrey500),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(IconStringConstants.flag),
            title: Text(
              'Report post',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: LegalReferralColors.textGrey500),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(
              IconStringConstants.editIcon,
              colorFilter: const ColorFilter.mode(
                LegalReferralColors.borderBlue100,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              'Edit',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: LegalReferralColors.textGrey500),
            ),
          ),
          const Divider(),
          // TODO:check it the post is already featured,
          // then make it unfeatured
          ListTile(
            leading: SvgPicture.asset(IconStringConstants.favorite),
            title: Text(
              'Make feature post',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: LegalReferralColors.textGrey500),
            ),
            onTap: () {
              final postId = feed?.feedPost?.postId;
              if (postId != null && userId != null) {
                _feedBloc.add(
                  PostSaved(
                    postId: postId,
                    userId: userId,
                  ),
                );
                context.pop();
              }
            },
          ),
          const Divider(),
          if (feed?.feedPost?.ownerId == userId)
            ListTile(
              onTap: () {
                final postId = feed?.feedPost?.postId;
                if (postId != null) {
                  _feedBloc.add(
                    PostDeleted(
                      postId: postId,
                    ),
                  );
                  context.pop();
                }
              },
              leading: SvgPicture.asset(
                IconStringConstants.deleteIcon,
                colorFilter: const ColorFilter.mode(
                  LegalReferralColors.borderBlue100,
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                'Delete',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textGrey500),
              ),
            ),
          const Divider(),
        ],
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
}
