import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/pages/project_details_page.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/attorney_details.dart';

class ActiveProjectCard extends StatelessWidget {
  const ActiveProjectCard({
    required this.caseName,
    required this.attorneyType,
    required this.attorneyName,
    required this.caseStatus,
    required this.action,
    required this.profileImage,
    required this.caseDescription,
    required this.startDate,
    super.key,
  });
  final String? caseName;
  final String? attorneyType;
  final String? attorneyName;
  final String? caseStatus;
  final String? action;
  final String? profileImage;
  final String? caseDescription;
  final String? startDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128.h,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            Container(
              width: 4.w,
              decoration: BoxDecoration(
                color: LegalReferralColors.textRed235,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(4.r),
                  bottomStart: Radius.circular(4.r),
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      height: 21.h,
                      decoration: BoxDecoration(
                        color: LegalReferralColors.containerRed255,
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(4.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconStringConstants.star,
                            colorFilter: const ColorFilter.mode(
                              LegalReferralColors.textRed235,
                              BlendMode.srcIn,
                            ),
                            height: 9.h,
                            width: 9.h,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            caseStatus ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: LegalReferralColors.textRed235,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        caseName ?? '',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      AttorneyDetails(
                        attorneyName: attorneyName,
                        attorneyType: attorneyType,
                        profileImage: profileImage,
                        radius: 15,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 12.w,
                          bottom: 8.h,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CustomTextButton(
                            text: action ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: LegalReferralColors.textBlue100,
                                ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProjectDetails(
                                    caseName: caseName,
                                    startDate: startDate,
                                    caseDescription: caseDescription,
                                    attorneyName: attorneyName,
                                    attorneyType: '$attorneyType • 1st',
                                    profileImage: profileImage,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
