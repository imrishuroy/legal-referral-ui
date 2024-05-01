import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/search/presentation/widgets/shimmers/search_shimmer.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              child: CustomTextField(
                controller: _searchController,
                hintText: 'search',
                labelText: '',
                showLabel: false,
                borderColor: LegalReferralColors.borderGrey199,
                fillColor: LegalReferralColors.containerWhite400,
              ),
            ),
          ),
        ),
      ),
      //remove safe area after words
      body: Column(
        children: [
          SizedBox(height: 8.h),
          const SearchShimmer(),
          // const RecentWidget(),
        ],
      ),
    );
  }
}
