import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class RecommendationSwipeCard extends StatelessWidget {
  const RecommendationSwipeCard({
    required this.name,
    required this.attorneyType,
    required this.avatarUrl,
    required this.practiceLocation,
    required this.percentThresholdX,
    super.key,
  });
  final String name;
  final String attorneyType;
  final String avatarUrl;
  final String practiceLocation;
  final int percentThresholdX;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: LegalReferralColors.backgroundWhite255,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CustomNetworkImage(
            imageUrl: avatarUrl,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8),
          ),
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
                practiceLocation,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: LegalReferralColors.textWhite255),
              ),
            ],
          ),
        ),
        if (percentThresholdX < -0.5)
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red,
                  Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Text(
                  'NOT INTERESTED',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
        if (percentThresholdX > 0.5)
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.green,
                  Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Text(
                  'INTERESTED',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
