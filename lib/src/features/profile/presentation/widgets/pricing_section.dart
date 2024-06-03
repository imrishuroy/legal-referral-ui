import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class PricingSection extends StatefulWidget {
  const PricingSection({
    required this.user,
    required this.profileBloc,
    required this.isCurrentUser,
    super.key,
  });

  final UserProfile? user;
  final ProfileBloc profileBloc;
  final bool isCurrentUser;

  @override
  State<PricingSection> createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
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
      isCurrentUser: widget.isCurrentUser,
      onTapAdd: () => context.pushNamed(
        AddUpdatePricePage.name,
        extra: AddUpdatePricePageArgs(
          profileBloc: widget.profileBloc,
          price: price,
        ),
      ),
      onTapEdit: () => context.pushNamed(
        AddUpdatePricePage.name,
        extra: AddUpdatePricePageArgs(
          profileBloc: widget.profileBloc,
          price: price,
        ),
      ),
      showAddButton: widget.user?.priceId == null,
      showEditButton: widget.user?.priceId != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: _priceLabel(
                price,
              ),
              style: Theme.of(context).textTheme.headlineMedium,
              children: <TextSpan>[
                TextSpan(
                  text: _priceTrailing(widget.user?.serviceType),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          if (!widget.isCurrentUser) const SizedBox(height: 8),
          if (widget.isCurrentUser)
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
