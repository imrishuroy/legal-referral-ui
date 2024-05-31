import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({
    super.key,
    this.tabIndex,
  });
  final int? tabIndex;

  static const String name = 'ReferralPage';

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  final _referralBloc = getIt<ReferralBloc>();

  @override
  void initState() {
    _referralBloc.add(
      ReferralInitialized(
        tabIndex: widget.tabIndex ?? 0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReferralBloc, ReferralState>(
      bloc: _referralBloc,
      builder: (context, state) {
        if (state.status == ReferralStatus.success) {
          return CustomTabView(
            tabNames: const [
              'Proposals',
              'My Referrals',
            ],
            tabViews: const [
              ProposalTab(),
              MyReferralsTab(),
            ],
            initialIndex: state.tabIndex,
          );
        }

        return const CustomLoadingIndicator();
      },
    );
  }
}
