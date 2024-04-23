import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        children: [
          SizedBox(height: 4.h),
          Column(
            children: [
              SizedBox(
                height: 220.h,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 140.h,
                      width: double.infinity,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 61.h,
                      left: 14.w,
                      child: CircleAvatar(
                        radius: 78.r,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.only(left: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 14.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Container(
                          height: 14.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          height: 14.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 14.h,
                      width: 240.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PriceShimmer extends StatelessWidget {
  const PriceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 14.h,
            width: 54.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            height: 14.h,
            width: 68.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            height: 14.h,
            width: 88.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }
}

class AverageBillingShimmer extends StatelessWidget {
  const AverageBillingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            width: 100.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

class CaseResolutionShimmer extends StatelessWidget {
  const CaseResolutionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const AverageBillingShimmer();
  }
}

class AboutShimmer extends StatelessWidget {
  const AboutShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        6,
        (index) {
          final containerWidths = <double>[
            100,
            double.maxFinite,
            250,
            double.maxFinite,
            double.maxFinite,
            300,
          ];
          return CustomShimmer(
            child: Container(
              width: containerWidths[index].w,
              height: 14.h,
              margin: EdgeInsets.symmetric(
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SocialShimmer extends StatelessWidget {
  const SocialShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(height: 8.h),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              2,
              (index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 14.w,
                        height: 14.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.h),
                      Container(
                        width: 200.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceShimmer extends StatelessWidget {
  const ExperienceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            height: 16.h,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 14.h,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    Container(
                      width: 200.w,
                      height: 14.h,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      width: 170.w,
                      height: 14.h,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      width: 70.w,
                      height: 14.h,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) {
                          final containerWidths = <double>[
                            double.maxFinite,
                            250,
                            double.maxFinite,
                            double.maxFinite,
                            300,
                          ];
                          return CustomShimmer(
                            child: Container(
                              width: containerWidths[index].w,
                              height: 14.h,
                              margin: EdgeInsets.symmetric(
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 14.h,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EducationShimmer extends StatelessWidget {
  const EducationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            height: 16.h,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 14.h,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    Container(
                      width: 200.w,
                      height: 14.h,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      width: 170.w,
                      height: 14.h,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      width: 70.w,
                      height: 14.h,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
