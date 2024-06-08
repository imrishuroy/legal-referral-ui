import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/otp_widget.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

class MobileVerificationModel extends StatefulWidget {
  const MobileVerificationModel({
    required this.mobile,
    required this.authBloc,
    super.key,
  });

  final String mobile;
  final AuthBloc authBloc;

  @override
  State<MobileVerificationModel> createState() =>
      _MobileVerificationModelState();
}

class _MobileVerificationModelState extends State<MobileVerificationModel> {
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
                switch (state.mobileOTPStatus) {
                  case MobileOTPStatus.verified:
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
                        Text(
                          'Mobile number verified',
                          style: TextStyle(
                            fontSize: 24.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        CustomElevatedButton(
                          onTap: () {
                            context.pop();
                            if (state.user?.wizardCompleted == true) {
                              context.goNamed(FeedsPage.name);
                            } else if (state.user?.signupMethod == 1 ||
                                state.user?.signupMethod == 2) {
                              // google, Linkedin, apple & facebook, signed up
                              // users will be redirected to wizard page
                              context.goNamed(WizardInspectionPage.name);
                            } else {
                              context.goNamed(
                                SocialAvatarPage.name,
                              );
                            }
                          },
                          text: 'Continue',
                        ),
                      ],
                    );

                  default:
                    return Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                state.mobileOTPStatus == MobileOTPStatus.failed,
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
                                ObscureTextUtil.obfuscateMobileNo(
                                  widget.mobile,
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
                                text: 'CHANGE NUMBER',
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
                                    MobileOTPRSent(
                                      mobile: widget.mobile,
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
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      widget.authBloc.add(
        MobileOTPVerified(
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
