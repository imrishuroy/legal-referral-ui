import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/otp_widget.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

class MobileVerificationModel extends StatefulWidget {
  const MobileVerificationModel({
    required this.mobile,
    required this.wizardBloc,
    super.key,
  });

  final String mobile;
  final WizardBloc wizardBloc;

  @override
  State<MobileVerificationModel> createState() =>
      _MobileVerificationModelState();
}

class _MobileVerificationModelState extends State<MobileVerificationModel> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  // bool _inValidOtp = false;
  /// Create FocusNode
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
            BlocBuilder<WizardBloc, WizardState>(
              bloc: widget.wizardBloc,
              builder: (context, state) {
                switch (state.mobileOtpStatus) {
                  case MobileOtpStatus.verified:
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
                          'Mobile number verified',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomElevatedButton(
                          onTap: () {
                            context.pop();
                            context.goNamed(HomePage.name);
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
                            isError:
                                state.mobileOtpStatus == MobileOtpStatus.failed,
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
                                  widget.mobile,
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
                                text: 'CHANGE NUMBER',
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
                                  context.pop();
                                  widget.wizardBloc.add(
                                    MobileOtpSent(
                                      mobile: widget.mobile,
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
      widget.wizardBloc.add(
        MobileOtpVerified(
          otp: _otpController.text,
          mobile: widget.mobile,
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
