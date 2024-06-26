import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/pages/payment_cycle_page.dart';

class RenewAdTile extends StatelessWidget {
  const RenewAdTile({required this.buttonText, super.key});
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CachedNetworkImage(
                fit: BoxFit.fill,
                height: 60.h,
                width: 60.w,
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/991px-Placeholder_view_vector.svg.png',
              ),
              title: Text(
                'Welcome to our new store',
                style: textTheme.headlineSmall,
              ),
              subtitle: Text(
                'Nam pellentesque magna ac ex convallis yet ehe'
                ' as ullamcorper. Mauris iaculis ullamcorper. Mauris iaculis',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: textTheme.bodyLarge
                    ?.copyWith(color: LegalReferralColors.textBlack300),
              ),
            ),
            const Gap(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Started on: ',
                        style: textTheme.bodyLarge?.copyWith(
                          color: LegalReferralColors.textGrey500,
                        ),
                      ),
                      TextSpan(text: '25 Jun 2024', style: textTheme.bodyLarge),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Started on: ',
                        style: textTheme.bodyLarge?.copyWith(
                          color: LegalReferralColors.textGrey500,
                        ),
                      ),
                      TextSpan(text: '30 Jun 2024', style: textTheme.bodyLarge),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(height: 16),
            CustomElevatedButton(
              text: buttonText,
              height: 44.h,
              onTap: () {
                //renew payment
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PaymentCyclePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
