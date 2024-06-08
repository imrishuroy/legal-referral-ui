import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';

class PostCommentPage extends StatelessWidget {
  const PostCommentPage({
    required this.attorneyName,
    required this.attorneyType,
    required this.postedTime,
    required this.child,
    super.key,
  });
  static const String routeName = 'postCommentPage';
  final String? attorneyName;
  final String? attorneyType;
  final String? postedTime;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.containerWhite500,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // PostStructure(
              //   attorneyName: attorneyName,
              //   attorneyType: attorneyType,
              //   postedTime: postedTime,
              //   child: child,
              // ),

              //* post likes
              Padding(
                padding: EdgeInsets.only(left: 12.w, right: 4.w),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'LIKES',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: LegalReferralColors.textGrey400),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 42.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: LegalReferralColors.borderGrey300,
                              width: 1.w,
                            ),
                          ),
                          child: CustomAvatar(
                            imageUrl: null,
                            radius: 20.r,
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        itemCount: 10,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //* post comments
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'COMMENTS',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: LegalReferralColors.textGrey400),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/tempImages/Likes.png',
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: LegalReferralColors.containerWhite400,
                              ),
                              padding: const EdgeInsets.all(8),
                              width: 295.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sinan Rakib • 1st',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    'Finance attorney',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color:
                                              LegalReferralColors.textGrey400,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    'Lorem ipsum dolor sit amet consectetur.'
                                    ' Risus lectus sit maecenas et.'
                                    ' Adipiscing viverra ac risus blandit'
                                    ' dignissim condimentum gravida.',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                HorizontalIconButton(
                                  text: 'Like •4',
                                  style: Theme.of(context).textTheme.titleSmall,
                                  height: 16.h,
                                  width: 16.w,
                                  icon: IconStringConstants.thumbUp,
                                  onTap: () {},
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                HorizontalIconButton(
                                  text: 'Reply',
                                  style: Theme.of(context).textTheme.titleSmall,
                                  height: 16.h,
                                  width: 16.w,
                                  icon: IconStringConstants.reply,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
