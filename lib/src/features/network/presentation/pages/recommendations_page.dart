import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  static const String name = 'RecommendationPage';

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
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
      ),
      body: BlocConsumer<NetworkBloc, NetworkState>(
        bloc: _networkBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == NetworkStatus.loading) {
            return const RecommendationsShimmer(
              itemCount: 4,
            );
          }

          final recommendations = state.recommendations;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: recommendations.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                mainAxisExtent: 226.h,
              ),
              itemBuilder: (BuildContext context, int index) {
                final recommendation = recommendations[index];
                return RecommendationCard(
                  recommendation: recommendation,
                  onConnect: () {},
                  onCancel: () {},
                );
              },
            ),
          );
        },
      ),
    );
  }
}
