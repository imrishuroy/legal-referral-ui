import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/search/presentation/widgets/shimmers/search_result_shimmer.dart';

class SearchPageResult extends StatefulWidget {
  const SearchPageResult({super.key});
  static const String name = 'SearchPageResult';

  @override
  State<SearchPageResult> createState() => _SearchPageResultState();
}

class _SearchPageResultState extends State<SearchPageResult> {
  final _searchController = TextEditingController();
  List<String> filterList = [
    'Filter',
    'People',
    'Posts',
    'News',
    'Filter',
    'People',
    'Posts',
    'News',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
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
              SizedBox(
                width: 8.w,
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            60.h,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              // left: 16.w,
              // right: 16.w,
              bottom: 16.h,
            ),
            child: SizedBox(
              height: 35.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: filterList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: CustomOutlinedButton(
                      text: filterList[index],
                      borderColor: LegalReferralColors.borderGrey400,
                      textColor: LegalReferralColors.textGrey400,
                      onPressed: () {},
                      width: 80.w,
                      // height: 35.h,
                      borderRadius: 64.r,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 8.h),
          const SearchResultShimmer(),
          // const SearchResultWidget(),
        ],
      ),
    );
  }
}
