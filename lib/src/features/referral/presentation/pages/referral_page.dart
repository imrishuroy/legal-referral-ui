import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/pages/my_referral_tab.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/pages/proposal_tab.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: LegalReferralColors.primaryBackground,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 41.h,
              decoration: BoxDecoration(
                color: LegalReferralColors.containerBlue221,
                borderRadius: BorderRadius.circular(
                  4.r,
                ),
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.h),
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                labelColor: LegalReferralColors.textBlue100,
                labelStyle: Theme.of(context).textTheme.titleLarge,
                unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
                unselectedLabelColor: LegalReferralColors.textGrey500,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    2.r,
                  ),
                  color: LegalReferralColors.containerWhite500,
                ),
                tabs: const [
                  Tab(
                    text: 'Proposals',
                  ),
                  Tab(
                    text: 'My Referrals',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            /// TabBar
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  /// Active Projects
                  ProposalTab(),
                  MyReferralTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}