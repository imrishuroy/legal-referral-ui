import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/data/data.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class SwipeRecommendationsPage extends StatefulWidget {
  const SwipeRecommendationsPage({super.key});

  static const String name = 'SwipeRecommendationsPage';

  @override
  State<SwipeRecommendationsPage> createState() =>
      _SwipeRecommendationsPageState();
}

class _SwipeRecommendationsPageState extends State<SwipeRecommendationsPage> {
  final CardSwiperController _cardSwiperController = CardSwiperController();
  final _authBloc = getIt<AuthBloc>();
  final _networkBloc = getIt<NetworkBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _networkBloc.add(
        RecommendationsFetched(
          userId: userId,
          offset: 1,
          limit: 10,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recommendation',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgButton(
              height: 24.h,
              width: 24.w,
              imagePath: IconStringConstants.cross2,
              onPressed: () => context.goNamed(FeedsPage.name),
            ),
          ),
        ],
      ),
      body: BlocConsumer<NetworkBloc, NetworkState>(
        bloc: _networkBloc,
        listener: (context, state) {
          if (state.recommendationStatus == RecommendationStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }

          if (state.recommendationStatus == RecommendationStatus.success &&
              state.recommendations.length < 2) {
            context.goNamed(FeedsPage.name);
          }
        },
        builder: (context, state) {
          if (state.recommendationStatus == RecommendationStatus.success) {
            if (state.recommendations.length < 2) {
              return const CustomLoadingIndicator();
            }
            return Column(
              children: [
                Flexible(
                  child: CardSwiper(
                    controller: _cardSwiperController,
                    onEnd: () {
                      context.goNamed(FeedsPage.name);
                    },
                    allowedSwipeDirection:
                        const AllowedSwipeDirection.symmetric(horizontal: true),
                    cardsCount: state.recommendations.length,
                    onSwipeDirectionChange: (direction, card) {
                      _networkBloc.add(
                        CardSwipeDetected(
                          direction: direction,
                        ),
                      );
                    },
                    onSwipe: (previousIndex, currentIndex, direction) async {
                      if (currentIndex == null) {
                        return false;
                      }

                      _networkBloc.add(
                        RecommendationIndexUpdated(
                          index: currentIndex,
                        ),
                      );

                      if (direction == CardSwiperDirection.left) {
                        final recommendation =
                            state.recommendations[currentIndex];
                        if (recommendation?.userId != null) {
                          _networkBloc.add(
                            RecommendationCancelled(
                              recommendedUserId: recommendation!.userId!,
                            ),
                          );
                        }
                      } else if (direction == CardSwiperDirection.right) {
                        final recommendation =
                            state.recommendations[currentIndex];
                        final userId = _authBloc.state.user?.userId;
                        if (userId != null && recommendation?.userId != null) {
                          _networkBloc.add(
                            ConnectionRequestSent(
                              sendConnectionReq: SendConnectionReq(
                                senderId: userId,
                                recipientId: recommendation!.userId!,
                              ),
                            ),
                          );
                        }
                      }

                      return true;
                    },
                    cardBuilder:
                        (context, index, percentThresholdX, percentThresholdY) {
                      final recommendation = state.recommendations[index];
                      final name = '${recommendation?.firstName} '
                          '${recommendation?.lastName}';

                      return RecommendationSwipeCard(
                        name: name,
                        attorneyType: recommendation?.practiceArea ?? '',
                        avatarUrl: recommendation?.avatarUrl ?? '',
                        practiceLocation:
                            recommendation?.practiceLocation ?? '',
                        percentThresholdX: percentThresholdX,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgButton(
                            height: 24,
                            width: 24,
                            color: LegalReferralColors.backgroundWhite255,
                            imagePath: IconStringConstants.cross2,
                            onPressed: () {
                              final recommendation = state.recommendations[
                                  state.recommendationCardIndex];

                              if (recommendation?.userId != null) {
                                _networkBloc.add(
                                  RecommendationCancelled(
                                    recommendedUserId: recommendation!.userId!,
                                  ),
                                );
                              }

                              _cardSwiperController
                                  .swipe(CardSwiperDirection.left);
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgButton(
                            height: 24,
                            width: 24,
                            color: LegalReferralColors.backgroundWhite255,
                            imagePath: IconStringConstants.addFollow,
                            onPressed: () {
                              final recommendation = state.recommendations[
                                  state.recommendationCardIndex];

                              final userId = _authBloc.state.user?.userId;
                              if (userId != null &&
                                  recommendation?.userId != null) {
                                _networkBloc.add(
                                  ConnectionRequestSent(
                                    sendConnectionReq: SendConnectionReq(
                                      senderId: userId,
                                      recipientId: recommendation!.userId!,
                                    ),
                                  ),
                                );
                              }

                              _cardSwiperController
                                  .swipe(CardSwiperDirection.right);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const CustomLoadingIndicator();
        },
      ),
    );
  }
}
