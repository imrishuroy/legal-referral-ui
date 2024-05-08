import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({
    required this.tabNames,
    required this.tabViews,
    super.key,
  });
  final List<String> tabNames;
  final List<Widget> tabViews;

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                tabs: widget.tabNames.map((name) => Tab(text: name)).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: widget.tabViews,
        ),
      ),
    );
  }
}
