import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_switch.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ProfilePricingSection extends StatefulWidget {
  const ProfilePricingSection({
    required this.user,
    required this.profileBloc,
    super.key,
  });

  final UserProfile? user;
  final ProfileBloc profileBloc;

  @override
  State<ProfilePricingSection> createState() => _ProfilePricingSectionState();
}

class _ProfilePricingSectionState extends State<ProfilePricingSection> {
  @override
  Widget build(BuildContext context) {
    final price = Price(
      priceId: widget.user?.priceId,
      serviceType: widget.user?.serviceType,
      perHourPrice: widget.user?.perHourPrice,
      perHearingPrice: widget.user?.perHearingPrice,
      contingencyPrice: widget.user?.contingencyPrice,
      hybridPrice: widget.user?.hybridPrice,
    );
    return ProfileSection(
      title: 'Pricing',
      actions: [
        if (widget.user?.priceId == null)
          CustomIconButton(
            onTap: () => context.pushNamed(
              AddEditPricePage.name,
              extra: AddEditPricePageArgs(
                profileBloc: widget.profileBloc,
                price: price,
              ),
            ),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(ImageStringsUtil.addIcon),
            ),
          ),
        if (widget.user?.priceId != null)
          CustomIconButton(
            onTap: () => context.pushNamed(
              AddEditPricePage.name,
              extra: AddEditPricePageArgs(
                profileBloc: widget.profileBloc,
                price: price,
              ),
            ),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(ImageStringsUtil.editIcon),
            ),
          ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: _priceLabel(
                Price(
                  priceId: widget.user?.priceId,
                  serviceType: widget.user?.serviceType,
                  perHourPrice: widget.user?.perHourPrice,
                  perHearingPrice: widget.user?.perHearingPrice,
                  contingencyPrice: widget.user?.contingencyPrice,
                  hybridPrice: widget.user?.hybridPrice,
                ),
              ),
              style: Theme.of(context).textTheme.displaySmall,
              children: <TextSpan>[
                TextSpan(
                  text: _priceTrailing(widget.user?.serviceType),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                'Open to refer',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              CustomSwitch(
                value: widget.user?.openToReferral ?? false,
                onChanged: (bool? value) {
                  widget.profileBloc.add(
                    ReferralToggled(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );

    // CustomCard(
    //   onTap: onEdit,
    //   title: 'Pricing',
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text.rich(
    //         TextSpan(
    //           text: user?.perHourPrice == null
    //               ? 'N/A'
    //               : '\$${user?.perHourPrice}',
    //           style: Theme.of(context).textTheme.displaySmall,
    //           children: <TextSpan>[
    //             TextSpan(
    //               text: user?.perHourPrice == null ? '' : '/hr',
    //               style: Theme.of(context).textTheme.titleMedium,
    //             ),
    //           ],
    //         ),
    //       ),
    //       Row(
    //         children: [
    //           Text(
    //             'Open to refer',
    //             style: Theme.of(context).textTheme.bodyLarge,
    //           ),
    //           const Spacer(),
    //           CustomSwitch(
    //             value: user?.openToReferral ?? false,
    //             onChanged: (bool? value) {
    //               profileBloc.add(
    //                 ReferralToggled(),
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  String _priceLabel(
    Price price,
  ) {
    switch (price.serviceType) {
      case PriceServiceType.perHour:
        return '\$${price.perHourPrice ?? 'N/A'}';
      case PriceServiceType.perHearing:
        return '\$${price.perHearingPrice ?? 'N/A'}';
      case PriceServiceType.contingency:
        return price.contingencyPrice ?? 'N/A';
      case PriceServiceType.hybrid:
        return price.hybridPrice ?? 'N/A';
      default:
        return '';
    }
  }

  String _priceTrailing(PriceServiceType? serviceType) {
    switch (serviceType) {
      case PriceServiceType.perHour:
        return '/hr';
      case PriceServiceType.perHearing:
        return '/hearing';
      case PriceServiceType.contingency:
        return '% of total amount';
      default:
        return '';
    }
  }
}
