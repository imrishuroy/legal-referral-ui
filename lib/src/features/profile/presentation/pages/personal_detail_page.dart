import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/social_avatar_page.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/customtextfield.dart';

class PersonalDetailsPage extends StatelessWidget {
  PersonalDetailsPage({super.key});
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _address = TextEditingController();
  final _practiceArea = TextEditingController();
  final _practiceLocation = TextEditingController();
  final _experience = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: const Text(
          'Share About You',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Personal',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _firstName,
                  hintText: 'John',
                  labelText: 'First Name',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _lastName,
                  hintText: 'David',
                  labelText: 'Last Name',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _address,
                  hintText: 'St. Thomas Street, Anchorage, Alaska, USA',
                  labelText: 'Address',
                ),
                const SizedBox(height: 24),
                const Text(
                  'Share About Your Experience',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _practiceArea,
                  hintText: 'Real estate, Finance etc',
                  labelText: 'Practice Area',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _practiceLocation,
                  hintText: 'Alaska, Florida',
                  labelText: 'Practice Location',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _experience,
                  hintText: '4 years',
                  labelText: 'Experience',
                ),
                const SizedBox(height: 24),
                CustomElevatedButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SocialAvatarPage(),
                      ),
                    );
                  },
                  text: 'Save and Proceed',
                ),
                const SizedBox(height: 58),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
