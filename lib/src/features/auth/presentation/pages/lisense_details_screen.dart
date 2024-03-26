import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customButton.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/customtextfield.dart';

class LicenseDetailScreen extends StatefulWidget {
  const LicenseDetailScreen({super.key});

  @override
  State<LicenseDetailScreen> createState() => _LicenseDetailScreenState();
}

class _LicenseDetailScreenState extends State<LicenseDetailScreen> {
  final _name = TextEditingController();
  final _licenseNumber = TextEditingController();
  final _issueDate = TextEditingController();
  final _issuestate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: LegalReferralColors.primaryBackground,
        centerTitle: false,
        title: const Text(
          'License Details',
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
                controller: _name,
                hintText: 'as in license',
                labelText: 'Name',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _licenseNumber,
                hintText: '23ude675',
                labelText: 'License Number',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _issueDate,
                hintText: 'St. Thomas Street, Anchorage, Alaska, USA',
                labelText: 'Issue Date',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _issuestate,
                hintText: 'State',
                labelText: 'Issue State',
              ),
              const SizedBox(height: 24),
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
                                      LegalReferralImg.successLogo),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                    'Your license details are submitted for verification and  will be verified within 2 days'),
                                const SizedBox(height: 32),
                                CustomButton(
                                    onTap: () {
                                      print('navigate to home page');
                                    },
                                    text: 'Continue')
                              ],
                            ),
                          ));
                },
                text: 'Save and Proceed',
              )
            ],
          ),
        ),
      ),
    );
  }
}
