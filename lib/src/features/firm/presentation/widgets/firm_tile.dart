import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/pages/create_firm_page.dart';

class FirmTile extends StatelessWidget {
  const FirmTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: ListTile(
        onTap: () {
          //go to firm page
        },
        trailing: SvgButton(
          imagePath: IconStringConstants.editIcon,
          color: LegalReferralColors.borderBlue100,
          width: 24.h,
          height: 24.h,
          onPressed: () {
            //go to edit button
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateFirmPage(),
              ),
            );
          },
        ),
        title: Text(
          'Davis Legal Group',
          style: textTheme.titleSmall,
        ),
        leading: SvgPicture.asset(
          '',
        ),
      ),
    );
  }
}
