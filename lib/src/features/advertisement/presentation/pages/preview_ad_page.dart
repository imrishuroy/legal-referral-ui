import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/advertisement/data/data.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class PreviewAdPageArgs {
  PreviewAdPageArgs({
    required this.title,
    required this.description,
    required this.link,
    required this.adBloc,
  });

  final String title;
  final String description;
  final String link;
  final AdBloc adBloc;
}

class PreviewAdPage extends StatefulWidget {
  const PreviewAdPage({
    required this.args,
    super.key,
  });

  final PreviewAdPageArgs args;

  static const String name = 'PreviewAdPage';

  @override
  State<PreviewAdPage> createState() => _PreviewAdPageState();
}

class _PreviewAdPageState extends State<PreviewAdPage> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final adBloc = widget.args.adBloc;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Preview', style: textTheme.headlineLarge),
      ),
      body: BlocConsumer<AdBloc, AdState>(
        bloc: adBloc,
        listener: (context, state) {
          if (state.status == AdStatus.success) {
            ToastUtil.showToast(
              context,
              title: 'Success',
              description: 'Ad created successfully',
              type: ToastificationType.success,
            );

            GoRouter.of(context).goNamed(AdPage.name);
          } else if (state.status == AdStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: 'Failed to create ad',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  color: LegalReferralColors.backgroundWhite255,
                  child: Column(
                    children: [
                      const Gap(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.args.title,
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
                            widget.args.description,
                            style: textTheme.bodyLarge?.copyWith(
                              color: LegalReferralColors.textBlack300,
                            ),
                          ),
                        ),
                      ),
                      AdMediaPreview(
                        files: state.files,
                        adType: state.adType,
                      ),
                      Center(
                        child: CustomOutlinedButton(
                          height: 38.h,
                          width: 122.w,
                          text: 'Learn More',
                          onPressed: () {},
                          textColor: LegalReferralColors.borderBlue100,
                          borderColor: LegalReferralColors.borderBlue100,
                        ),
                      ),
                      const Gap(height: 8),
                    ],
                  ),
                ),
                PaymentCycleWidget(
                  adBloc: adBloc,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.h),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
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
                      GestureDetector(
                        onTap: () => _pickStartDate(
                          context: context,
                          adBloc: adBloc,
                        ),
                        child: CustomTextField(
                          controller: _startDateController,
                          hintText: 'dd/mm/yyyy',
                          labelText: 'Start Date',
                          enabled: false,
                        ),
                      ),
                      const Gap(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () => _pickEndDate(
                          context: context,
                          adBloc: adBloc,
                        ),
                        child: CustomTextField(
                          controller: _endDateController,
                          hintText: '31/03/2024',
                          labelText: 'End Date',
                          enabled: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  child: CustomElevatedButton(
                    text: _getPaymentCycleText(state.paymentCycle),
                    isLoading: state.status == AdStatus.loading,
                    onTap: () => _createAd(context: context, state: state),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getPaymentCycleText(PaymentCycle paymentCycle) {
    switch (paymentCycle) {
      case PaymentCycle.weekly:
        return r'Pay $30/ Week';
      case PaymentCycle.monthly:
        return r'Pay $100/ Month';
      case PaymentCycle.yearly:
        return r'Pay $1000/ Year';
      default:
        return '';
    }
  }

  Future<void> _pickStartDate({
    required BuildContext context,
    required AdBloc adBloc,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      _startDateController.text = DateTimeUtil.getFormatDate(date);
      adBloc.add(AdStartDateChanged(startDate: date));
    }
  }

  Future<void> _pickEndDate({
    required BuildContext context,
    required AdBloc adBloc,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      _endDateController.text = DateTimeUtil.getFormatDate(date);
      adBloc.add(AdEndDateChanged(endDate: date));
    }
  }

  void _createAd({
    required BuildContext context,
    required AdState state,
  }) {
    final authBloc = getIt<AuthBloc>();

    final userId = authBloc.state.user?.userId;

    if (userId == null) {
      return;
    }

    if (state.startDate == null || state.endDate == null) {
      ToastUtil.showToast(
        context,
        title: 'Error',
        description: 'Please select start and end date',
        type: ToastificationType.warning,
      );

      return;
    }

    if (state.endDate!.isBefore(state.startDate!)) {
      ToastUtil.showToast(
        context,
        title: 'Error',
        description: 'End date should be greater than start date',
        type: ToastificationType.warning,
      );

      return;
    }

    final ad = CreateAdReq(
      type: state.adType,
      title: widget.args.title,
      description: widget.args.description,
      link: widget.args.link,
      paymentCycle: state.paymentCycle,
      authorId: userId,
      startDate: state.startDate!,
      endDate: state.endDate!,
      files: state.files,
    );

    widget.args.adBloc.add(AdCreated(ad: ad));
  }
}
