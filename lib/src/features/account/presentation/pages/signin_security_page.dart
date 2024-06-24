import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/account/presentation/pages/add_email_page.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';

class SignInSecurityPage extends StatelessWidget {
  SignInSecurityPage({required this.title, super.key});

  final String title;
  final List<String> securityList = [
    'Email Address',
    'Phone number',
    'Change Password',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        color: LegalReferralColors.backgroundWhite255,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Account access',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const Gap(height: 12),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                title: Text(
                  securityList[index],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _EmailAddressPage(
                            title: securityList[index],
                          ),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _PhoneNumberPage(
                            title: securityList[index],
                          ),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _ChangePasswordPage(
                            title: securityList[index],
                          ),
                        ),
                      );
                      break;
                  }
                },
              ),
              separatorBuilder: (context, index) => Divider(
                height: 4.h,
                color: const Color(0x18000000),
              ),
              itemCount: securityList.length,
            ),
          ],
        ),
      ),
    );
  }
}

// Private page classes

class _EmailAddressPage extends StatelessWidget {
  const _EmailAddressPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        color: LegalReferralColors.backgroundWhite255,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(height: 8),
              Text(
                'Emails you’ve added',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: LegalReferralColors.textGrey400),
              ),
              const Gap(height: 20),
              Text(
                'example@gmail.com',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
              const Gap(height: 20),
              HorizontalIconButton(
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: LegalReferralColors.textBlue100),
                text: 'Add Email Address',
                icon: IconStringConstants.addIcon,
                iconColor: LegalReferralColors.borderBlue100,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddEmailPage(),
                    ),
                  );
                },
              ),
              const Gap(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberPage extends StatelessWidget {
  const _PhoneNumberPage({required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        color: LegalReferralColors.backgroundWhite255,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(height: 8),
              Text(
                'Phone number added',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: LegalReferralColors.textGrey400),
              ),
              const Gap(height: 20),
              Text(
                '+1 347 877 7879',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
              const Gap(height: 20),
              HorizontalIconButton(
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: LegalReferralColors.textBlue100),
                text: 'Add Phone Number',
                icon: IconStringConstants.addIcon,
                iconColor: LegalReferralColors.borderBlue100,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactDetailsPage(),
                    ),
                  );
                },
              ),
              const Gap(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangePasswordPage extends StatelessWidget {
  const _ChangePasswordPage({required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SocialAvatarPage(
        title: 'Change Password',
        labelText1: 'Enter new Password',
        profilePicture: false,
      ),
    );
  }
}
