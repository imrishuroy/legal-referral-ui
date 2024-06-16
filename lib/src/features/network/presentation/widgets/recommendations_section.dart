import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/data/data.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class RecommendationsSection extends StatefulWidget {
  const RecommendationsSection({
    required this.networkBloc,
    super.key,
  });

  final NetworkBloc networkBloc;

  @override
  State<RecommendationsSection> createState() => _RecommendationsSectionState();
}

class _RecommendationsSectionState extends State<RecommendationsSection> {
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      widget.networkBloc.add(
        RecommendationsFetched(
          userId: userId,
          offset: 1,
          limit: 6,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      bloc: widget.networkBloc,
      builder: (context, state) {
        if (state.recommendationStatus == RecommendationStatus.loading) {
          return const RecommendationsShimmer(
            itemCount: 4,
          );
        }

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.recommendations.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            mainAxisExtent: 226.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            final recommendation = state.recommendations[index];
            return GestureDetector(
              onTap: () {
                final userId = recommendation?.userId;
                if (userId != null) {
                  context.pushNamed(
                    ProfilePage.name,
                    pathParameters: {
                      'userId': userId,
                    },
                  );
                }
              },
              child: RecommendationCard(
                recommendation: recommendation,
                onConnect: () {
                  final userId = _authBloc.state.user?.userId;
                  if (userId != null && recommendation?.userId != null) {
                    widget.networkBloc.add(
                      ConnectionReqSent(
                        sendConnectionReq: SendConnectionReq(
                          senderId: userId,
                          recipientId: recommendation!.userId!,
                        ),
                      ),
                    );
                  }
                },
                onCancel: () {
                  if (recommendation?.userId != null) {
                    widget.networkBloc.add(
                      RecommendationCancelled(
                        recommendedUserId: recommendation!.userId!,
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
