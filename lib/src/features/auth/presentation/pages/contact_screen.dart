import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/lisense_details_screen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/otp_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _contactNumber = TextEditingController();
  final _text1 = TextEditingController();
  final _text2 = TextEditingController();
  final _text3 = TextEditingController();
  final _text4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: LegalReferralColors.primaryBackground,
        centerTitle: false,
        title: const Text(
          'Contact Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextField(
                controller: _contactNumber,
                hintText: '+1 347 877 7879',
                labelText: 'Mobile Number',
              ),
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close_rounded),
                              ),
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
                                    fontWeight: FontWeight.w400,
                                  ),
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
                                    TextSpan(text: 'mobile number'),
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
                                    color: LegalReferralColors.textBlue100,
                                  ),
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
                                'Didn’t Received OTP?',
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
                                    color: LegalReferralColors.textBlue100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomButton(
                            onTap: () {
                              print(
                                'mobile number OTP: ${_text1.text + _text2.text + _text3.text + _text4.text}',
                              );

                              _text1.clear();
                              _text2.clear();
                              _text3.clear();
                              _text4.clear();

                              Navigator.pop(context);
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 24),
                                      SizedBox(
                                        height: 114,
                                        width: 114,
                                        child: SvgPicture.asset(
                                          LegalReferralImg.successLogo,
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
                                      CustomButton(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LicenseDetailScreen(),
                                            ),
                                          );
                                        },
                                        text: 'Continue',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            text: 'Verify',
                          ),
                        ],
                      ),
                    ),
                  );
                },
                text: 'Verify OTP',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
