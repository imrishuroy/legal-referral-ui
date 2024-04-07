import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_bottomsheet.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_snackbar.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

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
        title: Text(
          'Contact Details',
          style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          AppLogger.info('Auth Bloc Contact Details Page $state');
          if (state.mobileOTPStatus == MobileOTPStatus.sent) {
            _verifyMobileBottomSheet(context);
          }

          if (state.mobileOTPStatus == MobileOTPStatus.failed) {
            CustomSnackbar.showToast(
              context,
              title: 'Error',
              description: state.failure?.message,
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return state.mobileOTPStatus == MobileOTPStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          SizedBox(height: 24.h),
                          CustomTextField(
                            focusNode: _focusNode,
                            controller: _mobileTextController,
                            hintText: '+1 347 877 7879',
                            labelText: 'Mobile Number',
                            keyboardType: TextInputType.phone,
                            validator: (value) =>
                                Validator.validateMobile(value),
                          ),
                          SizedBox(height: 24.h),
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
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        MobileOTPRSent(
          mobile: _mobileTextController.text,
        ),
      );
    }
  }

  Future<void> _verifyMobileBottomSheet(BuildContext context) async {
    debugPrint('Verify Mobile Bottom Sheet');
    // TODO(Satyam): Add animation to it, smooth closing and smooth opening
    return CustomBottomSheet.show(
      context: context,
      child: MobileVerificationModel(
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
