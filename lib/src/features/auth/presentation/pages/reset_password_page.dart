import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  static const String name = 'ResetPasswordPage';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    _authBloc.add(AuthInitialized());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: Text(
          'Reset Password',
          style: TextStyle(
            fontSize: 20.h,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) async {
          if (state.emailOTPStatus == EmailOTPStatus.sent) {
            await CustomBottomSheet.show(
              context: context,
              child: EmailVerificationModal(
                email: _emailController.text,
                authBloc: _authBloc,
                isFromResetPassword: true,
              ),
            );
          }

          if (state.resetPasswordStatus == ResetPasswordStatus.failed) {
            if (!context.mounted) return;
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'Failed to reset password',
              type: ToastificationType.error,
            );
          }

          if (state.emailOTPStatus == EmailOTPStatus.failure) {
            if (!context.mounted) return;
            AppLogger.error('Error in sending OTP');
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'Failed to send OTP',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return state.emailOTPStatus == EmailOTPStatus.loading
              ? const CustomLoadingIndicator()
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 24.h),
                          Text(
                            'Enter your registered email address '
                            'to receive the OTP to reset the password.',
                            style: TextStyle(fontSize: 14.h),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'davidjohn2@gmail.com',
                            labelText: 'Registered email address',
                            validator: (value) =>
                                Validator.validateEmail(value),
                          ),
                          SizedBox(height: 24.h),
                          CustomElevatedButton(
                            onTap: _submit,
                            text: 'Receive OTP',
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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        EmailOTPSent(
          email: _emailController.text,
        ),
      );
    }
  }
}
