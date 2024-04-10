import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
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
        title: Text(
          'Upload License',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.h,
          ),
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
                  height: 150.h,
                  width: double.infinity,
                  color: LegalReferralColors.containerWhite500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          ImageStringsUtil.uploadIcon,
                        ),
                      ),
                      Text(
                        'Upload license .pdf\n2 MB max',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w400,
                          color: LegalReferralColors.textGrey400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                // uploaded file status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UPLOADED FILES',
                      style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w400,
                        color: LegalReferralColors.textGrey500,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      color: LegalReferralColors.containerWhite500,
                      height: 44.h,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(ImageStringsUtil.pdfIcon),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'License.pdf',
                              style: TextStyle(
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400,
                                color: LegalReferralColors.textGrey500,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(ImageStringsUtil.deleteIcon),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
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
