import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LegalReferralColors.containerWhite500,
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 10.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Text(
            'People',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: LegalReferralColors.textGrey400),
          ),

          SizedBox(height: 8.h),
          Row(
            children: [
              CustomOutlinedButton(
                text: 'All',
                borderColor: LegalReferralColors.borderGrey400,
                textColor: LegalReferralColors.textGrey400,
                onPressed: () {},
                width: 55.w,
                height: 35.h,
                borderRadius: 64.r,
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomOutlinedButton(
                text: '1st',
                borderColor: LegalReferralColors.borderGrey400,
                textColor: LegalReferralColors.textGrey400,
                onPressed: () {},
                width: 55.w,
                height: 35.h,
                borderRadius: 64.r,
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomOutlinedButton(
                text: '2nd',
                borderColor: LegalReferralColors.borderGrey400,
                textColor: LegalReferralColors.textGrey400,
                onPressed: () {},
                width: 55.w,
                height: 35.h,
                borderRadius: 64.r,
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // wrap this in listview
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => Column(
              children: [
                SizedBox(height: 8.h),
                HorizontalTile(
                  onPressed: () {},
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: LegalReferralColors.borderGrey300,
                        width: 1.w,
                      ),
                    ),
                    child: CustomAvatar(
                      radius: 25.r,
                      imageUrl: null,
                    ),
                  ),
                  spacing: 8.w,
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'James Do',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Vehicle Attorney',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: LegalReferralColors.textGrey500,
                            ),
                      ),
                      Text(
                        'Las vegas',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: LegalReferralColors.textGrey500,
                            ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 8.h,
                  color: const Color.fromRGBO(0, 0, 0, 0.1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
