import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/image_string_constants.dart';
import 'package:legal_referral_ui/src/features/network/presentation/widgets/shimmers/network_shimmer.dart';

class ConnectionPage extends StatelessWidget {
  ConnectionPage({super.key});
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          100.h,
        ),
        child: AppBar(
          title: Text(
            'Connections',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              50.h,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  CustomOutlinedButton(
                    borderRadius: 52.r,
                    height: 35.h,
                    width: 52.w,
                    onPressed: () {},
                    text: 'All',
                  ),
                  SizedBox(width: 8.w),
                  CustomOutlinedButton(
                    borderRadius: 52.r,
                    height: 35.h,
                    width: 52.w,
                    onPressed: () {},
                    text: '1st',
                  ),
                  SizedBox(width: 8.w),
                  CustomOutlinedButton(
                    borderRadius: 52.r,
                    height: 35.h,
                    width: 52.w,
                    onPressed: () {},
                    text: '2nd',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: CustomTextField(
                      controller: _search,
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
                SvgPicture.asset(
                  ImageStringConstants.filter,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              '132 CONNECTIONS',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: LegalReferralColors.textGrey500,
                  ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: LegalReferralColors.containerWhite500,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) => Column(
                    children: [
                      const ConnectionShimmer(),
                      // ConnectionListTile(),
                      Divider(
                        height: 0.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}
