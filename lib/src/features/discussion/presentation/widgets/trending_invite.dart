import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class TrendingInvite extends StatelessWidget {
  const TrendingInvite({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    '12/12/2013',
                    style: textTheme.bodyMedium
                        ?.copyWith(color: LegalReferralColors.textGrey117),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '• 16:24',
                    style: textTheme.bodyMedium
                        ?.copyWith(color: LegalReferralColors.textGrey117),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'The future of legal tech: Revolutionising the practise of law',
                style: textTheme.titleMedium,
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 42.h,
                child: Stack(
                  children: List.generate(4, (index) {
                    final leftPosition = index * 32.0;
                    return Positioned(
                      left: leftPosition,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        child: CircleAvatar(
                          backgroundImage: index < 3
                              ? const NetworkImage(
                                  'https://via.placeholder.com/150',
                                )
                              : null,
                          backgroundColor: index == 3
                              ? LegalReferralColors.containerBlue167
                              : null,
                          radius: 20.r,
                          child: index == 3
                              ? Text(
                                  '23+',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: const Color.fromRGBO(26, 26, 26, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const Divider(
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Center(
                      child: CustomTextButton(
                        onPressed: () {},
                        text: 'Reject',
                        style: textTheme.headlineSmall
                            ?.copyWith(color: LegalReferralColors.textGrey400),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      onTap: () {},
                      text: 'Join',
                      height: 36.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
