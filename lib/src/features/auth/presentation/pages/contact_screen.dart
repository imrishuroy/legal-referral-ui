import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/lisense_details_screen.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_textfield.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _contactNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: LegalReferralColors.primaryBackground,
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
                        children: [
                          CustomButton(
                            onTap: () {
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
