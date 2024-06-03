import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/attorney_details.dart';

class ReferredUserCard extends StatelessWidget {
  const ReferredUserCard({
    required this.user,
    required this.onAward,
    required this.onMessage,
    this.style,
    this.radius,
    super.key,
  });

  final ReferedUser? user;
  final TextStyle? style;
  final double? radius;
  final VoidCallback onAward;
  final VoidCallback onMessage;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final price = Price(
      priceId: user?.priceId,
      serviceType: user?.serviceType,
      perHourPrice: user?.perHourPrice,
      perHearingPrice: user?.perHearingPrice,
      contingencyPrice: user?.contingencyPrice,
      hybridPrice: user?.hybridPrice,
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: LegalReferralColors.containerWhite500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AttorneyDetails(
            attorneyName: '${user?.firstName} ${user?.lastName}',
            attorneyType: user?.practiceArea,
            profileImage: user?.avatarUrl,
            style: style,
            radius: radius,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SvgPicture.asset(IconStringConstants.favIcon),
              Text(
                '4.3 by 433 attorneys • 422 project',
                style: textTheme.bodyLarge
                    ?.copyWith(color: LegalReferralColors.textGrey400),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          RichText(
            text: TextSpan(
              text: 'Price: ',
              style: textTheme.titleMedium
                  ?.copyWith(color: LegalReferralColors.textGrey400),
              children: <TextSpan>[
                TextSpan(
                  text: _priceLabel(
                    price,
                  ),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: _priceTrailing(price.serviceType),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  width: 96.w,
                  height: 48.h,
                  textColor: LegalReferralColors.textBlue100,
                  borderColor: LegalReferralColors.borderBlue300,
                  onPressed: onAward,
                  text: 'Award',
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: CustomOutlinedButton(
                  width: 96.w,
                  height: 48.h,
                  textColor: LegalReferralColors.textBlue100,
                  borderColor: LegalReferralColors.borderBlue300,
                  onPressed: onMessage,
                  text: 'Message',
                ),
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
        return '\$${price.perHourPrice ?? '--'}';
      case PriceServiceType.perHearing:
        return '\$${price.perHearingPrice ?? '--'}';
      case PriceServiceType.contingency:
        return price.contingencyPrice ?? '--';
      case PriceServiceType.hybrid:
        return price.hybridPrice ?? '--';
      default:
        return '--';
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
