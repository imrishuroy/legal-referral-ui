import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ExtendAdPeriodPage extends StatefulWidget {
  const ExtendAdPeriodPage({
    super.key,
    this.ad,
  });

  final Ad? ad;

  static const String name = 'ExtendAdPeriodPage';

  @override
  State<ExtendAdPeriodPage> createState() => _ExtendAdPeriodPageState();
}

class _ExtendAdPeriodPageState extends State<ExtendAdPeriodPage> {
  final _adBloc = getIt<AdBloc>();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    final endDate = widget.ad?.endDate;
    if (endDate != null) {
      _endDateController.text = DateTimeUtil.getFormatDate(endDate);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extend Ad'),
      ),
      body: BlocConsumer<AdBloc, AdState>(
        bloc: _adBloc,
        listener: (context, state) {
          if (state.status == AdStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          } else if (state.status == AdStatus.success) {
            ToastUtil.showToast(
              context,
              title: 'Success',
              description: 'Ad period extended successfully',
              type: ToastificationType.success,
            );
            context.pop(true);
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                color: LegalReferralColors.backgroundWhite255,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.ad?.title ?? '',
                          style: textTheme.headlineSmall?.copyWith(
                            color: LegalReferralColors.textBlack300,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.ad?.description ?? '',
                          style: textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textBlack300,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Select Ad Start Date',
                      style: textTheme.headlineLarge,
                    ),
                    const Gap(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () => _pickEndDate(
                        context: context,
                        adBloc: _adBloc,
                      ),
                      child: CustomTextField(
                        controller: _endDateController,
                        hintText: '31/03/2024',
                        labelText: 'End Date',
                        enabled: false,
                      ),
                    ),
                    const Gap(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: CustomElevatedButton(
                        text: 'Extend Ad Period',
                        isLoading: state.status == AdStatus.loading,
                        onTap: () => _extendAdPeriod(
                          context: context,
                          state: state,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _pickEndDate({
    required BuildContext context,
    required AdBloc adBloc,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: widget.ad?.endDate ?? DateTime.now(),
      firstDate: widget.ad?.endDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      _endDateController.text = DateTimeUtil.getFormatDate(date);
      adBloc.add(AdEndDateChanged(endDate: date));
    }
  }

  Future<void> _extendAdPeriod({
    required BuildContext context,
    required AdState state,
  }) async {
    final adId = widget.ad?.adId;

    if (adId != null && state.endDate != null || widget.ad?.startDate != null) {
      if (state.endDate!.isBefore(widget.ad!.startDate)) {
        ToastUtil.showToast(
          context,
          title: 'Error',
          description: 'End date should be greater than current date',
          type: ToastificationType.error,
        );
        return;
      }

      _adBloc.add(
        AdPeriodExtended(
          adId: adId!,
          endDate: state.endDate!,
        ),
      );
    }
  }
}
