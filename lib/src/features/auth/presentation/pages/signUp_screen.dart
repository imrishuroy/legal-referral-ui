import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/contact_screen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/logIn_screen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customButton.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customtextfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/otp_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _emailAddress = TextEditingController();

  final _text1 = TextEditingController();
  final _text2 = TextEditingController();
  final _text3 = TextEditingController();
  final _text4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 160,
                  width: 160,
                  child: SvgPicture.asset(
                    LegalReferralImg.legalReferralLogo,
                  ),
                ),

                // Sign Up fiels
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _firstName,
                  hintText: 'David',
                  labelText: 'First Name',
                  // validator: () {
                  //   return null;
                  // },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _lastName,
                  hintText: 'John',
                  labelText: 'Last Name',
                  // validator: () {
                  //   return null;
                  // },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _emailAddress,
                  hintText: 'JohnDavid22@gmail.com',
                  labelText: 'Email address',
                  // validator: () {
                  //   return null;
                  // },
                ),
                const SizedBox(height: 24),
                // verify button
                CustomButton(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                          text: 'd******9@**ail.com',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
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
                                          color:
                                              LegalReferralColors.textBlue100),
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
                                          color:
                                              LegalReferralColors.textBlue100),
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
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 24),
                                            SizedBox(
                                              height: 114,
                                              width: 114,
                                              child: SvgPicture.asset(
                                                  LegalReferralImg.successLogo),
                                            ),
                                            const SizedBox(height: 24),
                                            const Text(
                                              'Email verified',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(height: 40),
                                            CustomButton(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ContactScreen(),
                                                  ),
                                                );
                                              },
                                              text: 'Continue',
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
                  text: 'Verify Email',
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text(
                      'Already a member?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LegalReferralColors.textgrey300,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'LOG IN',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(89, 158, 217, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
