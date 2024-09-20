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

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({
    required this.email,
    super.key,
  });

  final String email;

  static const String name = 'NewPasswordPage';

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __) {
        _authBloc.add(AuthInitialized());
      },
      child: Scaffold(
        backgroundColor: LegalReferralColors.primaryBackground,
        appBar: AppBar(
          backgroundColor: LegalReferralColors.primaryBackground,
          centerTitle: false,
          title: Text(
            'New Password',
            style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.w600),
          ),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          bloc: _authBloc,
          listener: (context, state) {
            if (state.resetPasswordStatus == ResetPasswordStatus.success) {
              CustomBottomSheet.show(
                context: context,
                child: const PasswordResetModel(),
              );
            }

            if (state.resetPasswordStatus == ResetPasswordStatus.failed) {
              ToastUtil.showToast(
                context,
                title: 'Error',
                description:
                    state.failure?.message ?? 'Failed to reset password',
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            return state.resetPasswordStatus == ResetPasswordStatus.loading
                ? const CustomLoadingIndicator()
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19.w),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 24.h,
                              ),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: 'Enter new password',
                                labelText: 'New password',
                                obscureText: true,
                                validator: (value) =>
                                    Validator.validatePassword(value),
                              ),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                controller: _confirmPasswordController,
                                hintText: 'Confirm password',
                                labelText: 'Confirm password',
                                obscureText: true,
                                validator: (value) =>
                                    Validator.validatePassword(value),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              CustomElevatedButton(
                                onTap: _resetPassword,
                                text: 'Reset Password',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  void _resetPassword() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      final password = _passwordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();

      if (password != confirmPassword) {
        ToastUtil.showToast(
          context,
          title: 'Error',
          description: 'Passwords do not match',
          type: ToastificationType.error,
        );
        return;
      }

      _authBloc.add(
        PasswordChanged(
          email: widget.email,
          password: password,
        ),
      );
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
