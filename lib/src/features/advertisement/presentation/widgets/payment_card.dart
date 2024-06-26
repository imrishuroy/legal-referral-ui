import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({
    required this.cardType,
    super.key,
  });
  final String cardType;
  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _expirationDate = TextEditingController();
  final TextEditingController _securityCode = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      dense: true,
      trailing: SvgPicture.asset(
        IconStringConstants.card,
        height: 24.h,
        width: 24.w,
      ),
      iconColor: LegalReferralColors.borderGrey400,
      collapsedIconColor: LegalReferralColors.borderGrey400,
      tilePadding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      shape: const Border(),
      collapsedBackgroundColor: LegalReferralColors.backgroundWhite255,
      backgroundColor: LegalReferralColors.backgroundWhite255,
      title: Text(
        widget.cardType,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      children: [
        const Divider(
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
        CustomTextField(
          controller: _firstName,
          hintText: 'David',
          labelText: 'First Name',
        ),
        const Gap(height: 16),
        CustomTextField(
          controller: _lastName,
          hintText: 'John',
          labelText: 'Last Name',
        ),
        const Gap(height: 16),
        CustomTextField(
          controller: _cardNumber,
          hintText: 'xxxx  xxxx  xxxx  xxxx',
          labelText: 'Card Number',
        ),
        const Gap(height: 16),
        CustomTextField(
          controller: _expirationDate,
          hintText: 'MM/YY',
          labelText: 'Expiration Date',
        ),
        const Gap(height: 16),
        CustomTextField(
          controller: _securityCode,
          hintText: '000',
          labelText: 'Security Code',
        ),
        const Gap(height: 16),
        CustomTextField(
          controller: _country,
          hintText: 'Country',
          labelText: 'Country',
        ),
        const Gap(height: 16),
        CustomTextField(
          controller: _postalCode,
          hintText: '42001',
          labelText: 'Postal Code',
        ),
      ],
    );
  }
}
