import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/referral_card.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/shimmers/active_referrals_shimmer.dart';

class ActiveReferrals extends StatefulWidget {
  const ActiveReferrals({super.key});

  @override
  State<ActiveReferrals> createState() => _ActiveReferralsState();
}

class _ActiveReferralsState extends State<ActiveReferrals> {
  final _authBloc = getIt<AuthBloc>();
  final _referralBloc = getIt<ReferralBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _referralBloc.add(
        ReferralFetched(userId: userId),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Text(
            'Active Referrals',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        BlocConsumer<ReferralBloc, ReferralState>(
          bloc: _referralBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == ReferralStatus.loading) {
              return const ActiveReferralShimmer();
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.referrals.length,
              itemBuilder: (context, index) {
                final referral = state.referrals[index];

                return GestureDetector(
                  onTap: () => context.pushNamed(
                    ReferralDetailPage.name,
                    extra: referral,
                  ),
                  child: ReferralCard(
                    referral: referral,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 1.h,
              ),
            );
          },
        ),
      ],
    );
  }
}
