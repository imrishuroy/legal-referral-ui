import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_textfield.dart';
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
        title: const Text(
          'License Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocConsumer<WizardBloc, WizardState>(
        bloc: widget.wizardBloc,
        listener: (context, state) {
          if (state.wizardStatus == WizardStatus.success) {
            _successBottomSheet(context);
          }
        },
        builder: (context, state) {
          return state.wizardStatus == WizardStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          CustomTextField(
                            controller: _name,
                            hintText: 'as in license',
                            labelText: 'Name',
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _licenseNumber,
                            hintText: '23ude675',
                            labelText: 'License Number',
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _issueDate,
                            hintText: 'mm/dd/yyyy',
                            labelText: 'Issue Date',
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _issuestate,
                            hintText: 'State',
                            labelText: 'Issue State',
                          ),
                          const SizedBox(height: 24),
                          CustomElevatedButton(
                            onTap: _saveLicense,
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

  void _saveLicense() {
    // FocusManager.instance.primaryFocus?.unfocus();
    final userId = _authBloc.state.user?.id;

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
    return showModalBottomSheet(
      backgroundColor: LegalReferralColors.containerWhite500,
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            SizedBox(
              height: 114,
              width: 114,
              child: SvgPicture.asset(
                ImageStringsUtil.successLogo,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Your license details are submitted for '
              'verification and  will be verified within 2 days',
            ),
            const SizedBox(height: 32),
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
          ],
        ),
      ),
    );
  }
}
