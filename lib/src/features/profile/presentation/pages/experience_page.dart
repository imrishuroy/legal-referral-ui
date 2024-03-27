import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/customtextfield.dart';

class ExperiencePage extends StatelessWidget {
  ExperiencePage({super.key});
  final _title = TextEditingController();
  final _companyName = TextEditingController();
  final _startDate = TextEditingController();
  final _endDate = TextEditingController();
  final _description = TextEditingController();
  final bool isCurrentlyWorkingHere = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: const Text(
          'Experience Details',
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
                CustomTextField(
                  controller: _title,
                  hintText: 'Senior attorney',
                  labelText: 'title',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _companyName,
                  hintText: 'Simon LAW firm',
                  labelText: 'Company name',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _startDate,
                  hintText: 'dd/mm/yyyy',
                  labelText: 'Start date',
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: isCurrentlyWorkingHere,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (value) {},
                    ),
                    const Text('Currently work here'),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _endDate,
                  hintText: 'dd/mm/yyyy',
                  labelText: 'End date',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _description,
                  hintText: 'Job summary',
                  maxLines: 3,
                  labelText: 'Description',
                ),
                const SizedBox(height: 24),
                CustomElevatedButton(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => ));
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
