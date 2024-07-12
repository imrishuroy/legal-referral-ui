import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/pages/payment_page.dart';

class PaymentCyclePage extends StatelessWidget {
  const PaymentCyclePage({super.key});

  static const String name = 'PaymentCyclePage';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Ad Period', style: textTheme.headlineLarge),
      ),
      body: const PaymentCycleWidget(),
    );
  }
}

class PaymentCycleWidget extends StatefulWidget {
  const PaymentCycleWidget({super.key});

  @override
  State<PaymentCycleWidget> createState() => _PaymentCycleWidgetState();
}

class _PaymentCycleWidgetState extends State<PaymentCycleWidget> {
  final TextEditingController _startDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final paymentCycles = [
      {
        'title': 'Weekly',
        'subtitle': r' ($30 per week)',
      },
      {
        'title': 'Monthly',
        'subtitle': r' ($100 per month | Save 20%)',
      },
      {
        'title': 'Yearly',
        'subtitle': r' ($900 per Annum | Save 60%)',
      },
    ];

    const groupValue = '';
    void onChanged(String? value) {}

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.h),
            padding: EdgeInsets.symmetric(vertical: 8.h),
            color: LegalReferralColors.backgroundWhite255,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Text(
                    'Select Payment cycle',
                    style: textTheme.headlineLarge,
                  ),
                ),
                const Gap(height: 12),
                ...List.generate(paymentCycles.length, (index) {
                  final cycle = paymentCycles[index];
                  return RadioListTile<String>(
                    dense: true,
                    value: cycle['title']!,
                    groupValue: groupValue,
                    onChanged: onChanged,
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: cycle['title'],
                            style: textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: cycle['subtitle'],
                            style: textTheme.bodyLarge?.copyWith(
                              color: const Color.fromRGBO(102, 102, 102, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.h),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            color: LegalReferralColors.backgroundWhite255,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Ad Start Date',
                  style: textTheme.headlineLarge,
                ),
                const Gap(
                  height: 16,
                ),
                CustomTextField(
                  controller: _startDate,
                  hintText: 'dd/mm/yyyy',
                  labelText: 'Start Date',
                ),
                const Gap(
                  height: 16,
                ),
                CustomTextField(
                  controller: _startDate,
                  hintText: '31/03/2024',
                  labelText: 'End Date',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: CustomElevatedButton(
              text: r'Pay $30/ Week',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
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
