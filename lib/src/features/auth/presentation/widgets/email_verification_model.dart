import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/otp_widget.dart';

class EmailVerificationModal extends StatefulWidget {
  const EmailVerificationModal({
    required this.email,
    required this.authBloc,
    this.isFromResetPassword = false,
    super.key,
  });

  final String email;
  final AuthBloc authBloc;
  final bool isFromResetPassword;

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
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 32,
      ),
      // width: double.infinity,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom.h,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.h),
            BlocBuilder<AuthBloc, AuthState>(
              bloc: widget.authBloc,
              builder: (context, state) {
                switch (state.emailOTPStatus) {
                  case EmailOTPStatus.verified:
                    return Column(
                      children: [
                        SizedBox(
                          height: 114.h,
                          width: 114.w,
                          child: SvgPicture.asset(
                            IconStringConstants.successLogo,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        const Text(
                          'Verified',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        CustomElevatedButton(
                          onTap: () {
                            context.pop();
                            AppLogger.info(
                              'is from reset password: '
                              '${widget.isFromResetPassword}',
                            );
                            if (widget.isFromResetPassword) {
                              context.pushNamed(
                                NewPasswordPage.name,
                                pathParameters: {
                                  'email': widget.email,
                                },
                              );
                            } else {
                              context.goNamed(ContactDetailsPage.name);
                            }
                          },
                          text: widget.isFromResetPassword
                              ? 'Set New Password'
                              : 'Continue',
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
                              Text(
                                'Enter OTP',
                                style: TextStyle(
                                  fontSize: 20.h,
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
                          SizedBox(height: 24.h),
                          OtpWidget(
                            pinController: _otpController,
                            focusNode: _pinputFocusNode,
                            isError:
                                state.emailOTPStatus == EmailOTPStatus.failure,
                            errorText: state.failure?.message,
                            validator: (otp) {
                              debugPrint('OTP validator: $otp');
                              if (otp!.isEmpty) {
                                return 'Please enter OTP';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            '4 digit OTP has been send to ',
                            style: TextStyle(
                              fontSize: 14.h,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Wrap(
                            children: [
                              Text(
                                ObscureTextUtil.obfuscateEmail(
                                  widget.email,
                                ),
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              CustomTextButton(
                                fontSize: 14.h,
                                fontWeight: FontWeight.w600,
                                text: 'CHANGE MAIL ID',
                                textColor: LegalReferralColors.textBlue100,
                                onPressed: () => context.pop(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Wrap(
                            children: [
                              const Text("Didn't Received OTP? "),
                              CustomTextButton(
                                fontSize: 14.h,
                                fontWeight: FontWeight.w600,
                                text: 'RESEND OTP',
                                textColor: LegalReferralColors.textBlue100,
                                onPressed: () {
                                  context.pop();
                                  widget.authBloc.add(
                                    EmailOTPSent(
                                      email: widget.email,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
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
        EmailOTPVerified(
          email: widget.email,
          otp: _otpController.text,
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
