import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/experience_page.dart';

class UploadLicensePage extends StatelessWidget {
  const UploadLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: LegalReferralColors.primaryBackground,
        title: const Text(
          'Upload License',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // ------ license upload container
                Container(
                  height: 150,
                  width: double.infinity,
                  color: LegalReferralColors.containerWhite500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          LegalReferralImg.uploadIcon,
                        ),
                      ),
                      const Text(
                        'Upload license .pdf\n2 MB max',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: LegalReferralColors.textGrey400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                // uploaded file status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'UPLOADED FILES',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: LegalReferralColors.textGrey500,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      color: LegalReferralColors.containerWhite500,
                      height: 44,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(LegalReferralImg.pdfIcon),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'License.pdf',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: LegalReferralColors.textGrey500,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(LegalReferralImg.deleteIcon),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomElevatedButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ExperiencePage(),
                      ),
                    );
                  },
                  text: 'Save and proceed',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
