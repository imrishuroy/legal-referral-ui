import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/pages/payment_page.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Summary', style: textTheme.headlineLarge),
      ),
      body: Column(
        children: [
          //bill
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            color: LegalReferralColors.backgroundWhite255,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amount Details',
                  style: textTheme.headlineLarge,
                ),
                const Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Weekly', style: textTheme.bodyLarge),
                    Text(r'$30.00', style: textTheme.labelMedium),
                  ],
                ),
                const Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('GST (18%)', style: textTheme.bodyLarge),
                    Text(r'$7.00', style: textTheme.labelMedium),
                  ],
                ),
                const Divider(
                  height: 24,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: textTheme.bodyLarge),
                    Text(r'$37.00', style: textTheme.labelMedium),
                  ],
                ),
              ],
            ),
          ),
          //payment details
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            color: LegalReferralColors.backgroundWhite255,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Details',
                  style: textTheme.headlineLarge,
                ),
                const Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('VISA-1123', style: textTheme.bodyLarge),
                    SvgButton(
                      height: 24.h,
                      width: 24.w,
                      imagePath: IconStringConstants.editIcon,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PaymentPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          //your orders
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            color: LegalReferralColors.backgroundWhite255,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Order',
                  style: textTheme.headlineLarge,
                ),
                const Gap(height: 12),
                Wrap(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: textTheme.bodyLarge,
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.brightness_1,
                              size: 6,
                              color: Colors.black,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          TextSpan(
                            text:
                                ' Your ad begins today and'
                                ' renews automatically on ',
                            style: textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: 'May 9, 2024.',
                            style: textTheme.labelMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: textTheme.bodyLarge,
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.brightness_1,
                              size: 6,
                              color: Colors.black,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          TextSpan(
                            text: ' Your payment method will be charged ',
                            style: textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: r'$37.00',
                            style: textTheme.labelMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' each week (tax included).',
                            style: textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: textTheme.bodyLarge,
                        children: const [
                          WidgetSpan(
                            child: Icon(
                              Icons.brightness_1,
                              size: 6,
                              color: Colors.black,
                            ),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          TextSpan(
                            text:
                                ' The plan will automatically renew each '
                                'week until cancelled. To avoid charges for '
                                'the next week, cancel'
                                ' before the renewal date.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: CustomElevatedButton(
              text: r'Pay $30/ Week',
              onTap: () {
                CustomBottomSheet.show(
                  maxWidth: double.infinity,
                  context: context,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(height: 24),
                      SvgPicture.asset(IconStringConstants.successLogo),
                      const Gap(height: 24),
                      Text(
                        'Advertisement Created',
                        style: textTheme.displaySmall,
                      ),
                      const Gap(height: 40),
                      CustomElevatedButton(
                        text: 'Done',
                        onTap: () {
                          context.pop();
                        },
                      ),
                      const Gap(height: 24),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
