import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
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

  @override
  void initState() {
    _fetchFeeds();
    super.initState();
  }

  void _fetchFeeds() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _feedBloc.add(FeedsFetched(userId: userId));
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
                onTap: () {},
                child: CustomTextField(
                  controller: _searchController,
                  hintText: 'Search',
                  labelText: '',
                  showLabel: false,
                  borderColor: LegalReferralColors.borderGrey199,
                  fillColor: LegalReferralColors.containerWhite400,
                  enabled: false,
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
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => context.pushNamed(
              ProfilePage.name,
              pathParameters: {
                'userId': _authBloc.state.user?.userId ?? '',
              },
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                _authBloc.state.user?.avatarUrl ?? '',
              ),
            ),
          ),
        ),
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
            return const Center(child: CustomLoadingIndicator());
          } else if (state.status == FeedStatus.success &&
              state.feeds.isEmpty) {
            return const Center(child: Text('No feeds available'));
          } else if (state.status == FeedStatus.success) {
            return RefreshIndicator(
              onRefresh: () async {
                _fetchFeeds();
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final feed = state.feeds[index];
                        return FeedTile(
                          feed: feed,
                          onLikePressed: () {},
                          onCommentPressed: () {},
                          onSharePressed: () {},
                        );
                      },
                      childCount: state.feeds.length,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('something went wrong'));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
