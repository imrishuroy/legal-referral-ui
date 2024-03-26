import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/new_passwordScreen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customButton.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customtextfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/otp_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();
  final _text1 = TextEditingController();
  final _text2 = TextEditingController();
  final _text3 = TextEditingController();
  final _text4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: const Text(
          'Reset Password',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text(
                'Enter your registered email address or mobile number to receive the OTP to reset the password.'),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
                controller: _emailController,
                hintText: 'davidjohn2@gmail.com',
                labelText: 'Registered email address or mobile number'),
            const SizedBox(height: 24),
            CustomButton(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              const Text(
                                'Enter OTP',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close_rounded))
                            ],
                          ),
                          const SizedBox(height: 24),
                          OtpWidget(
                            text1: _text1,
                            text2: _text2,
                            text3: _text3,
                            text4: _text4,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                      text: '4 digit OTP has been sent to ',
                                    ),
                                    TextSpan(
                                      text: '+1 3*******879',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(text: 'mobile number')
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'CHANGE NUMBER',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: LegalReferralColors.textBlue100),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Didn’t Received OTP?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'RESEND OTP',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: LegalReferralColors.textBlue100),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomButton(
                            onTap: () {
                              print(
                                  'mobile number OTP: ${_text1.text + _text2.text + _text3.text + _text4.text}');

                              _text1.clear();
                              _text2.clear();
                              _text3.clear();
                              _text4.clear();

                              Navigator.pop(context);
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 24),
                                        Row(
                                          children: [
                                            const Text(
                                              'Enter OTP',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                    Icons.close_rounded))
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                        OtpWidget(
                                          text1: _text1,
                                          text2: _text2,
                                          text3: _text3,
                                          text4: _text4,
                                        ),
                                        const SizedBox(height: 24),
                                        Row(
                                          children: [
                                            RichText(
                                              text: const TextSpan(
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '4 digit OTP has been sent to ',
                                                  ),
                                                  TextSpan(
                                                    text: 'd******9@**ail.com',
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'CHANGE MAIL ID',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: LegalReferralColors
                                                        .textBlue100),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Didn’t Received OTP?",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'RESEND OTP',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: LegalReferralColors
                                                        .textBlue100),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        CustomButton(
                                          onTap: () {
                                            print(
                                                'Email OTP: ${_text1.text + _text2.text + _text3.text + _text4.text}');

                                            _text1.clear();
                                            _text2.clear();
                                            _text3.clear();
                                            _text4.clear();

                                            Navigator.pop(context);
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const SizedBox(
                                                          height: 24),
                                                      SizedBox(
                                                        height: 114,
                                                        width: 114,
                                                        child: SvgPicture.asset(
                                                            LegalReferralImg
                                                                .successLogo),
                                                      ),
                                                      const SizedBox(
                                                          height: 24),
                                                      const Text(
                                                        'Email verified',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      const SizedBox(
                                                          height: 40),
                                                      CustomButton(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .push(
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  NewPasswordScreen(),
                                                            ),
                                                          );
                                                        },
                                                        text:
                                                            'Set new Password',
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          text: 'Verify',
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            text: 'Verify',
                          ),
                        ],
                      ),
                    ),
                  );
                },
                text: 'Receive OTP')
          ],
        ),
      ),
    ));
  }
}
