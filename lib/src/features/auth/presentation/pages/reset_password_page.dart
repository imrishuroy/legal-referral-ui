import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/validators/validators.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: const Text(
          'Reset Password',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state.resetPasswordStatus == ResetPasswordStatus.sent) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Password reset link has been sent to your email',
                ),
              ),
            );
            context.goNamed(SignInPage.name);
          }

          if (state.resetPasswordStatus == ResetPasswordStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.failure?.message ?? 'Failed to reset password',
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return state.resetPasswordStatus == ResetPasswordStatus.loading
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            'Enter your registered email address '
                            'o reset the password',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'davidjohn2@gmail.com',
                            labelText: 'Registered email address',
                            validator: (value) =>
                                Validator.validateEmail(value),
                          ),
                          const SizedBox(height: 24),
                          CustomElevatedButton(
                            onTap: _submit,
                            text: 'Receive Eamil',
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
        AuthResetPassword(
          email: _emailController.text,
        ),
      );
    }
  }
}
