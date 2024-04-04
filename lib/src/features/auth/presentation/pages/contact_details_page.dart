import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_textfield.dart';

class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({
    super.key,
  });

  static const name = 'ContactDetailsPage';

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _mobileTextController = TextEditingController();
  final _focusNode = FocusNode();
  final _authBloc = getIt<AuthBloc>();

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
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          AppLogger.info('Auth Bloc Contact Details Page $state');
          if (state.authStatus == AuthStatus.signedUp &&
                  state.mobileOTPStatus == MobileOTPStatus.sent ||
              state.mobileOTPStatus == MobileOTPStatus.resent) {
            _verifyMobileBottomSheet(context);
          }

          if (state.mobileOTPStatus == MobileOTPStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.failure?.message}'),
              ),
            );
          }
        },
        builder: (context, state) {
          return state.mobileOTPStatus == MobileOTPStatus.verifying
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
    //_focusNode.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      debugPrint('Mobile number: ${_mobileTextController.text}');
      _authBloc.add(
        MobileOTPRequested(
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
        authBloc: _authBloc,
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
