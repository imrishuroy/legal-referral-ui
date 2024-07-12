import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({super.key});

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  final CardSwiperController _cardSwiperController = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    final cards = <Widget>[
      const _FollowersCard(
        name: 'David John',
        attorneyType: 'Corporate Attorney',
        location: 'California',
      ),
      const _FollowersCard(
        name: 'Vincent Dave',
        attorneyType: 'Real estate attorney',
        location: 'Alaska',
      ),
      const _FollowersCard(
        name: 'James Doe',
        attorneyType: 'Criminal Attorney',
        location: 'Alaska',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recommendation',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgButton(
              height: 24.h,
              width: 24.w,
              imagePath: IconStringConstants.cross2,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: CardSwiper(
              controller: _cardSwiperController,
              allowedSwipeDirection:
                  const AllowedSwipeDirection.symmetric(horizontal: true),
              cardsCount: cards.length,
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) {
                return cards[index];
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgButton(
                      height: 24,
                      width: 24,
                      color: LegalReferralColors.backgroundWhite255,
                      imagePath: IconStringConstants.cross2,
                      onPressed: () {
                        _cardSwiperController.swipe(CardSwiperDirection.left);
                      },
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgButton(
                      height: 24,
                      width: 24,
                      color: LegalReferralColors.backgroundWhite255,
                      imagePath: IconStringConstants.addFollow,
                      onPressed: () {
                        _cardSwiperController.swipe(CardSwiperDirection.right);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FollowersCard extends StatelessWidget {
  const _FollowersCard({
    required this.name,
    required this.attorneyType,
    required this.location,
  });
  final String name;
  final String attorneyType;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: LegalReferralColors.backgroundWhite255,
        ),
        Image.asset(
          IconStringConstants.avatarPlaceholder,
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.4),
        ),
        Positioned(
          bottom: 12,
          left: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: LegalReferralColors.textWhite255),
              ),
              Text(
                attorneyType,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textWhite255),
              ),
              Text(
                location,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textWhite255),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
