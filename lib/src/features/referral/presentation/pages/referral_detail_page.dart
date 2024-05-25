import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class ReferralDetailPage extends StatelessWidget {
  const ReferralDetailPage({
    super.key,
    this.referral,
  });
  final Referral? referral;
  static const String name = 'ReferralDetailPage';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          referral?.title ?? '',
          style: textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Container(
              color: LegalReferralColors.backgroundWhite255,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReferralCard(
                    referral: referral,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      referral?.caseDescription ?? '',
                      style: textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            if (referral?.referralId != null)
              _ActiveReferredUsers(
                referral: referral,
              ),
          ],
        ),
      ),
    );
  }
}

class _ActiveReferredUsers extends StatefulWidget {
  const _ActiveReferredUsers({
    required this.referral,
  });

  final Referral? referral;

  @override
  State<_ActiveReferredUsers> createState() => _ActiveReferredUsersState();
}

class _ActiveReferredUsersState extends State<_ActiveReferredUsers> {
  final _referrerBloc = getIt<ReferralBloc>();

  @override
  void initState() {
    final referralId = widget.referral?.referralId;
    if (referralId != null) {
      _referrerBloc.add(
        ReferredUsersFetched(referralId: referralId),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralBloc, ReferralState>(
      bloc: _referrerBloc,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    'Active Referrals',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 12.r,
                    child: Text(
                      state.referredUsers.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            if (state.status == ReferralStatus.loading)
              const CustomLoadingIndicator()
            else
              ListView.separated(
                shrinkWrap: true,
                itemCount: state.referredUsers.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final referredUser = state.referredUsers[index];
                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      ReferralProposalPage.name,
                      extra: ReferralProposalPageArgs(
                        referredUser: referredUser,
                        referral: widget.referral,
                      ),
                    ),
                    child: ActiveReferral(
                      attorneyName: '${referredUser?.firstName ?? ''} '
                          '${referredUser?.lastName ?? ''}',
                      attorneyType: referredUser?.practiceArea ?? '',
                      profileImage: referredUser?.avatarUrl,
                      radius: 28.r,
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.h,
                ),
              ),
          ],
        );
      },
    );
  }
}
