import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/contact_screen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/logIn_screen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customButton.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customtextfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _emailAddress = TextEditingController();
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
                          return Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text('Enter OTP'),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.close_outlined,
                                      ),
                                    )
                                  ],
                                ),
                                CustomButton(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
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
                                                    LegalReferralImg
                                                        .successLogo),
                                              ),
                                              const SizedBox(height: 24),
                                              const Text(
                                                'Email verified',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                        });
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
