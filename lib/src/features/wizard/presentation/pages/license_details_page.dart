import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/date_time_util.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_bottom_sheet.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

class LicenseDetailPage extends StatefulWidget {
  const LicenseDetailPage({
    required this.wizardBloc,
    super.key,
  });
  final WizardBloc wizardBloc;

  @override
  State<LicenseDetailPage> createState() => _LicenseDetailPageState();
}

class _LicenseDetailPageState extends State<LicenseDetailPage> {
  final _name = TextEditingController();
  final _licenseNumber = TextEditingController();
  final _issueDate = TextEditingController();
  final _issuestate = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: LegalReferralColors.primaryBackground,
        centerTitle: false,
        title: Text(
          'License Details',
          style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocConsumer<WizardBloc, WizardState>(
        bloc: widget.wizardBloc,
        listener: (context, state) {
          if (state.wizardStatus == WizardStatus.success &&
              state.wizardStep == WizardStep.license) {
            _successBottomSheet(context);
          }
        },
        builder: (context, state) {
          return state.wizardStatus == WizardStatus.loading
              ? const CustomLoadingIndicator()
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(height: 24.h),
                          CustomTextField(
                            controller: _name,
                            hintText: 'as in license',
                            labelText: 'Name',
                            validator: (value) =>
                                Validator.validateLicenseName(value),
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            controller: _licenseNumber,
                            hintText: '23ude675',
                            labelText: 'License Number',
                            validator: (value) =>
                                Validator.validateLicenseNumber(value),
                          ),
                          SizedBox(height: 16.h),
                          GestureDetector(
                            onTap: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                                initialDate: DateTime.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary:
                                            LegalReferralColors.buttonPrimary,
                                      ),
                                      dialogBackgroundColor:
                                          LegalReferralColors.primaryBackground,
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (pickedDate != null) {
                                _issueDate.text = DateTimeUtil.getFormattedDate(
                                  pickedDate,
                                );
                              }
                            },
                            child: CustomTextField(
                              controller: _issueDate,
                              hintText: 'mm/dd/yyyy',
                              labelText: 'Issue Date',
                              validator: (value) =>
                                  Validator.validateIssueDate(value),
                              enabled: false,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            controller: _issuestate,
                            hintText: 'State',
                            labelText: 'Issue State',
                            validator: (value) =>
                                Validator.validateIssueState(value),
                          ),
                          SizedBox(height: 24.h),
                          CustomElevatedButton(
                            onTap: _save,
                            text: 'Save and Proceed',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  void _save() {
    final userId = _authBloc.state.user?.userId;

    if (_formKey.currentState!.validate() && userId != null) {
      final license = License(
        userId: userId,
        name: _name.text,
        licenseNumber: _licenseNumber.text,
        issueDate: _issueDate.text,
        issueState: _issuestate.text,
      );
      widget.wizardBloc.add(LicenseSaved(license: license));
    }
  }

  Future<dynamic> _successBottomSheet(BuildContext context) {
    return CustomBottomSheet.show(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24.h),
          SizedBox(
            height: 114.h,
            width: 114.w,
            child: SvgPicture.asset(
              ImageStringsUtil.successLogo,
            ),
          ),
          SizedBox(height: 24.h),
          const Text(
            'Your license details are submitted for '
            'verification and  will be verified within 2 days',
          ),
          SizedBox(height: 32.h),
          CustomElevatedButton(
            onTap: () {
              debugPrint('navigate to home page');
              context.pop();
              widget.wizardBloc.add(
                const WizardStepChanged(
                  wizardStep: WizardStep.uploadLicense,
                ),
              );
            },
            text: 'Continue',
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _licenseNumber.dispose();
    _issueDate.dispose();
    _issuestate.dispose();
    super.dispose();
  }
}
