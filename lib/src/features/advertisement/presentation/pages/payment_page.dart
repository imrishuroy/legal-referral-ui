import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/pages/payment_summary.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/widgets/payment_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Payment', style: textTheme.headlineLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //bill
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              color: LegalReferralColors.backgroundWhite255,
              child: Column(
                children: [
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
            //payment mode
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              color: LegalReferralColors.backgroundWhite255,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Payment Method',
                    style: textTheme.headlineLarge,
                  ),
                  const Gap(height: 25),
                  const PaymentCard(cardType: 'Credit Card'),
                  const Divider(
                    height: 8,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                  const PaymentCard(cardType: 'Debit Card'),
                  const Divider(
                    height: 8,
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: CustomElevatedButton(
                text: 'Review Order',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PaymentSummary(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
