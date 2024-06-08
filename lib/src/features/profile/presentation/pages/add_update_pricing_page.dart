import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AddUpdatePricePageArgs {
  AddUpdatePricePageArgs({
    required this.profileBloc,
    this.price,
  });
  final ProfileBloc profileBloc;
  final Price? price;
}

class AddUpdatePricePage extends StatefulWidget {
  const AddUpdatePricePage({
    required this.args,
    super.key,
  });

  final AddUpdatePricePageArgs args;

  static const String name = 'AddUpdatePricePage';

  @override
  State<AddUpdatePricePage> createState() => _AddUpdatePricePageState();
}

class _AddUpdatePricePageState extends State<AddUpdatePricePage> {
  final _formKey = GlobalKey<FormState>();
  final _priceController = TextEditingController();

  @override
  void initState() {
    if (widget.args.price != null) {
      final price = widget.args.price!;
      if (price.serviceType != null) {
        _priceController.text = price.serviceType == PriceServiceType.perHour
            ? price.perHourPrice.toString()
            : price.serviceType == PriceServiceType.perHearing
                ? price.perHearingPrice.toString()
                : price.serviceType == PriceServiceType.contingency
                    ? price.contingencyPrice!
                    : price.hybridPrice!;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = widget.args.profileBloc;
    final price = widget.args.price;
    return Scaffold(
      appBar: AppBar(
        elevation: 2.h,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
        title: Text(
          price?.priceId == null ? 'Pricing' : 'Edit Pricing',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.h,
          ),
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        listener: (context, state) {
          if (state.pricingStatus == PricingStatus.success) {
            AppLogger.info(
              'Profile updated successfully ${state.userProfile}',
            );
            context.pop();
          } else if (state.pricingStatus == PricingStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'An error occurred',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return state.pricingStatus == PricingStatus.loading
              ? const CustomLoadingIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      margin: EdgeInsets.symmetric(vertical: 16.h),
                      color: LegalReferralColors.containerWhite500,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12.h),
                            Text(
                              'How do you charge for your service?',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 16),
                            Column(
                              children: PriceServiceType.values.map((option) {
                                return RadioListTile<PriceServiceType>(
                                  contentPadding: EdgeInsets.zero,
                                  fillColor: WidgetStateProperty.all(
                                    LegalReferralColors.buttonPrimary,
                                  ),
                                  visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor:
                                      LegalReferralColors.buttonPrimary,
                                  title: Text(
                                    _getPriceOption(option),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  value: option,
                                  groupValue: state.selectedPriceServiceType,
                                  onChanged: (value) {
                                    if (value != null) {
                                      _priceController.clear();
                                      FocusScope.of(context).unfocus();
                                      profileBloc.add(
                                        PricingOptionSelected(
                                          pricinServiceType: value,
                                        ),
                                      );
                                    }
                                  },
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: _priceController,
                              hintText: _getPriceHint(
                                state.selectedPriceServiceType,
                              ),
                              labelText: _getPriceLabel(
                                state.selectedPriceServiceType,
                              ),
                              keyboardType: _getKeyboardType(
                                state.selectedPriceServiceType,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a value';
                                } else if (state.selectedPriceServiceType ==
                                        PriceServiceType.perHour ||
                                    state.selectedPriceServiceType ==
                                        PriceServiceType.perHearing) {
                                  if (double.tryParse(value) == null) {
                                    return 'Price must be a number';
                                  }
                                } else if (state.selectedPriceServiceType ==
                                    PriceServiceType.contingency) {
                                  if (int.tryParse(value)! > 100) {
                                    return 'Percentage must be less than 100';
                                  }
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 28.h),
                            CustomElevatedButton(
                              onTap: () => _addEditPrice(
                                priceServiceType:
                                    state.selectedPriceServiceType,
                                priceId: price?.priceId,
                                profileBloc: profileBloc,
                              ),
                              text: 'Save',
                            ),
                            SizedBox(height: 12.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  TextInputType _getKeyboardType(PriceServiceType priceServiceType) {
    switch (priceServiceType) {
      case PriceServiceType.perHour:
      case PriceServiceType.perHearing:
      case PriceServiceType.contingency:
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  String _getPriceOption(PriceServiceType priceServiceType) {
    switch (priceServiceType) {
      case PriceServiceType.perHour:
        return 'Per hour';
      case PriceServiceType.perHearing:
        return 'Per hearing';
      case PriceServiceType.contingency:
        return 'Contingency';
      case PriceServiceType.hybrid:
        return 'Hybrid';
      default:
        return 'Per hour';
    }
  }

  String _getPriceLabel(PriceServiceType priceServiceType) {
    switch (priceServiceType) {
      case PriceServiceType.contingency:
        return 'Your percentage';
      case PriceServiceType.hybrid:
        return r'2% contingency plus $700 per appearance';
      default:
        return 'Desired price';
    }
  }

  String _getPriceHint(PriceServiceType priceServiceType) {
    switch (priceServiceType) {
      case PriceServiceType.contingency:
        return '20% of total amount';
      case PriceServiceType.hybrid:
        return 'Hybrid';
      default:
        return r'$ 100';
    }
  }

  void _addEditPrice({
    required PriceServiceType priceServiceType,
    required int? priceId,
    required ProfileBloc profileBloc,
  }) {
    if (_formKey.currentState!.validate()) {
      final price = Price(
        serviceType: priceServiceType,
        perHourPrice: priceServiceType == PriceServiceType.perHour
            ? double.tryParse(_priceController.text)
            : null,
        perHearingPrice: priceServiceType == PriceServiceType.perHearing
            ? double.tryParse(_priceController.text)
            : null,
        contingencyPrice: priceServiceType == PriceServiceType.contingency
            ? _priceController.text
            : null,
        hybridPrice: priceServiceType == PriceServiceType.hybrid
            ? _priceController.text
            : null,
      );

      if (priceId != null) {
        profileBloc.add(
          PriceUpdated(
            priceId: priceId,
            price: price,
          ),
        );
      } else {
        profileBloc.add(PriceAdded(price: price));
      }
    }
  }
}
