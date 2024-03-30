import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({super.key});
  static const String name = 'ContactDetailsPage';

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _mobileTextController = TextEditingController();

  final _wizardBloc = getIt<WizardBloc>();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: LegalReferralColors.primaryBackground,
        centerTitle: false,
        title: const Text(
          'Contact Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocConsumer<WizardBloc, WizardState>(
        bloc: _wizardBloc,
        listener: (context, state) {
          if (state.mobileOtpStatus == MobileOtpStatus.sent &&
              state.wizardStatus == WizardStatus.success) {
            _verifyMobileBottomSheet(context);
          }

          if (state.wizardStatus == WizardStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failure!.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return state.wizardStatus == WizardStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          CustomTextField(
                            focusNode: _focusNode,
                            controller: _mobileTextController,
                            hintText: '+1 347 877 7879',
                            labelText: 'Mobile Number',
                          ),
                          const SizedBox(height: 24),
                          CustomElevatedButton(
                            onTap: _verifyOtp,
                            text: 'Verify OTP',
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

  void _verifyOtp() {
    debugPrint('Verify OTP');
    _focusNode.unfocus();
    if (_formKey.currentState!.validate()) {
      debugPrint('Mobile number: ${_mobileTextController.text}');
      _wizardBloc.add(
        MobileOtpSent(
          mobile: _mobileTextController.text,
        ),
      );
    }
  }

  Future<void> _verifyMobileBottomSheet(BuildContext context) async {
    debugPrint('Verify Mobile Bottom Sheet');
    // TODO(Satyam): Add animation to it, smooth closing and smooth opening
    return showModalBottomSheet(
      isDismissible: false,
      backgroundColor: LegalReferralColors.containerWhite500,
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (context) => MobileVerificationModel(
        mobile: _mobileTextController.text,
        wizardBloc: _wizardBloc,
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _mobileTextController.dispose();
    super.dispose();
  }
}
