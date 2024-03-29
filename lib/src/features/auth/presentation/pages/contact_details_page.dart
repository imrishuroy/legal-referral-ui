import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/lisense_details_page.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/widgets/otp_widget.dart';

class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({super.key});
  static const String name = 'ContactDetailsPage';

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  final _contactNumber = TextEditingController();
  final _pinController = TextEditingController();

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
              CustomElevatedButton(
                onTap: () => phoneBottomSheet(context),
                text: 'Verify OTP',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> phoneBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: LegalReferralColors.containerWhite500,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),

              //* --- Enter OTP ---
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

              //* --- OTP widget ---

              OtpWidget(pinController: _pinController),
              const SizedBox(
                height: 24,
              ),

              Wrap(
                children: [
                  const Text(
                    ' 4 digit OTP has been send to ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    '+1 3******879',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    ' mobile number. ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CustomTextButton(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    text: 'CHANGE NUMBER',
                    textColor: LegalReferralColors.textBlue100,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Wrap(
                children: [
                  const Text("Didn't Received OTP? "),
                  CustomTextButton(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    text: 'RESEND OTP',
                    textColor: LegalReferralColors.textBlue100,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              CustomElevatedButton(
                onTap: () {
                  Navigator.of(context).pop();
                  _pinController.clear();
                  successBottomSheet(context);
                },
                text: 'Verify',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> successBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: LegalReferralColors.containerWhite500,
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
                ImageStringsUtil.successLogo,
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
            CustomElevatedButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LicenseDetailPage(),
                  ),
                );
              },
              text: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
