import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/presentation.dart';

class PaymentCyclePage extends StatelessWidget {
  const PaymentCyclePage({
    required this.adBloc,
    super.key,
  });

  final AdBloc adBloc;

  static const String name = 'PaymentCyclePage';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Ad Period',
          style: textTheme.headlineLarge,
        ),
      ),
      body: PaymentCycleWidget(
        adBloc: adBloc,
      ),
    );
  }
}

class PaymentCycleWidget extends StatefulWidget {
  const PaymentCycleWidget({required this.adBloc, super.key});

  final AdBloc adBloc;

  @override
  State<PaymentCycleWidget> createState() => _PaymentCycleWidgetState();
}

class _PaymentCycleWidgetState extends State<PaymentCycleWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // final paymentCycles = [
    //   {
    //     'title': 'Weekly',
    //     'subtitle': r' ($30 per week)',
    //   },
    //   {
    //     'title': 'Monthly',
    //     'subtitle': r' ($100 per month | Save 20%)',
    //   },
    //   {
    //     'title': 'Yearly',
    //     'subtitle': r' ($900 per Annum | Save 60%)',
    //   },
    // ];

    // const groupValue = '';
    // void onChanged(String? value) {}

    return BlocBuilder<AdBloc, AdState>(
      bloc: widget.adBloc,
      builder: (context, state) {
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
                    RadioListTile<PaymentCycle>(
                      value: PaymentCycle.weekly,
                      groupValue: state.paymentCycle,
                      onChanged: (paymentCycle) {
                        if (paymentCycle != null) {
                          widget.adBloc.add(
                            PaymentCycleChanged(
                              paymentCycle: paymentCycle,
                            ),
                          );
                        }
                      },
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Weekly',
                              style: textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text: r'($30 per week)',
                              style: textTheme.bodyLarge?.copyWith(
                                color: const Color.fromRGBO(102, 102, 102, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(height: 12),
                    RadioListTile<PaymentCycle>(
                      value: PaymentCycle.monthly,
                      groupValue: state.paymentCycle,
                      onChanged: (paymentCycle) {
                        if (paymentCycle != null) {
                          widget.adBloc.add(
                            PaymentCycleChanged(
                              paymentCycle: paymentCycle,
                            ),
                          );
                        }
                      },
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Monthly',
                              style: textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text: r'($100 per month | Save 20%)',
                              style: textTheme.bodyLarge?.copyWith(
                                color: const Color.fromRGBO(102, 102, 102, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(height: 12),
                    RadioListTile<PaymentCycle>(
                      value: PaymentCycle.yearly,
                      groupValue: state.paymentCycle,
                      onChanged: (paymentCycle) {
                        if (paymentCycle != null) {
                          widget.adBloc.add(
                            PaymentCycleChanged(
                              paymentCycle: paymentCycle,
                            ),
                          );
                        }
                      },
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Yearly',
                              style: textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text: r'($900 per Annum | Save 60%)',
                              style: textTheme.bodyLarge?.copyWith(
                                color: const Color.fromRGBO(102, 102, 102, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
