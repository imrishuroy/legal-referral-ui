import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/otp_widget.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

class EmailVerificationModal extends StatefulWidget {
  const EmailVerificationModal({
    required this.email,
    required this.authBloc,
    super.key,
  });

  final String email;

  final AuthBloc authBloc;

  @override
  State<EmailVerificationModal> createState() => _EmailVerificationModalState();
}

class _EmailVerificationModalState extends State<EmailVerificationModal> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _pinputFocusNode = FocusNode();

  @override
  void initState() {
    _pinputFocusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            BlocConsumer<AuthBloc, AuthState>(
              bloc: widget.authBloc,
              listener: (context, state) {
                if (state.emailOtpStatus == EmailOtpStatus.failed) {}
              },
              builder: (context, state) {
                switch (state.emailOtpStatus) {
                  case EmailOtpStatus.verified:
                    return Column(
                      children: [
                        SizedBox(
                          height: 114,
                          width: 114,
                          child: SvgPicture.asset(
                            ImageStringsUtil.successLogo,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'E-mail verified',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomElevatedButton(
                          onTap: () {
                            context.pop();
                            context.goNamed(WizardInspectionPage.name);
                          },
                          text: 'Continue',
                        ),
                      ],
                    );

                  default:
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Enter OTP',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => context.pop(),
                                icon: const Icon(Icons.close_rounded),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          OtpWidget(
                            pinController: _otpController,
                            focusNode: _pinputFocusNode,
                            isError:
                                state.emailOtpStatus == EmailOtpStatus.failed,
                            errorText: state.failure?.message,
                            validator: (otp) {
                              debugPrint('OTP validator: $otp');
                              if (otp!.isEmpty) {
                                return 'Please enter OTP';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            ' 4 digit OTP has been send to ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Wrap(
                            children: [
                              Text(
                                ObscureTextUtil.obfuscateEmail(
                                  widget.email,
                                ),
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              CustomTextButton(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                text: 'CHANGE MAIL ID',
                                textColor: LegalReferralColors.textBlue100,
                                onPressed: () => context.pop(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Wrap(
                            children: [
                              const Text("Didn't Received OTP? "),
                              CustomTextButton(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                text: 'RESEND OTP',
                                textColor: LegalReferralColors.textBlue100,
                                onPressed: () {
                                  widget.authBloc.add(
                                    EmailOtpResend(
                                      email: widget.email,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomElevatedButton(
                            onTap: _onVerify,
                            text: 'Verify',
                          ),
                        ],
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onVerify() {
    if (_formKey.currentState!.validate()) {
      widget.authBloc.add(
        EmailOtpVerified(
          email: widget.email,
          otp: int.parse(_otpController.text),
        ),
      );
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
