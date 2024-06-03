import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class MyReferralsTab extends StatefulWidget {
  const MyReferralsTab({super.key});

  @override
  State<MyReferralsTab> createState() => _MyReferralsTabState();
}

class _MyReferralsTabState extends State<MyReferralsTab> {
  final _referralBloc = getIt<ReferralBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralBloc, ReferralState>(
      bloc: _referralBloc,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              ActiveProjects(
                isReferrer: true,
                onRefresh: () {},
              ),
              SizedBox(
                height: 24.h,
              ),
              const ActiveReferrals(),
              SizedBox(
                height: 24.h,
              ),
              const CompletedProjects(
                isReferrer: true,
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
