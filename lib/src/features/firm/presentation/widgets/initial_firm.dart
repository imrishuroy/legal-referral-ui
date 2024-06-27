import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/pages/create_firm_page.dart';

class InitialFirm extends StatelessWidget {
  const InitialFirm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: HorizontalIconButton(
        style: textTheme.titleSmall
            ?.copyWith(color: LegalReferralColors.textBlue100),
        text: 'Create a Firm Page',
        icon: IconStringConstants.addIcon,
        iconColor: LegalReferralColors.borderBlue100,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateFirmPage(),
            ),
          );
        },
      ),
    );
  }
}
