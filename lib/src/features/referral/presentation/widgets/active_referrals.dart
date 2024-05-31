import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

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
    return BlocConsumer<ReferralBloc, ReferralState>(
      bloc: _referralBloc,
      listener: (context, state) {
        if (state.status == ReferralStatus.failure) {
          ToastUtil.showToast(
            context,
            title: 'Error',
            description: state.failure?.message ?? 'something went wrong',
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        final referrals = state.referrals;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReferralSectionTitle(
              title: 'Active Referrals',
              count: referrals.length,
            ),
            SizedBox(
              height: 12.h,
            ),
            if (state.status == ReferralStatus.loading)
              const ActiveReferralShimmer(),
            if (state.status == ReferralStatus.success && referrals.isEmpty)
              const EmptyItem(message: 'No active projects'),
            if (state.status == ReferralStatus.success)
              ListView.separated(
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
              ),
          ],
        );
      },
    );
  }
}
