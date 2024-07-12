import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class PostModelBottomSheet extends StatelessWidget {
  const PostModelBottomSheet({super.key});

  static const String name = 'bottomSheet';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: SvgPicture.asset(
              IconStringConstants.addIcon,
              colorFilter: const ColorFilter.mode(
                LegalReferralColors.buttonPrimary,
                BlendMode.srcIn,
              ),
            ),
            title: const Text('Referral'),
            onTap: () {
              context.pop();
              context.pushNamed(
                CreateReferralPage.name,
              );
            },
          ),
          Divider(
            height: 1,
            color: Colors.grey.shade200,
          ),
          ListTile(
            leading: SvgPicture.asset(
              IconStringConstants.feed,
              colorFilter: const ColorFilter.mode(
                LegalReferralColors.buttonPrimary,
                BlendMode.srcIn,
              ),
            ),
            title: const Text('Feed'),
            onTap: () {
              context.pop();
              context.pushNamed(
                CreatePostPage.name,
              );
            },
          ),
          Divider(
            height: 1,
            color: Colors.grey.shade200,
          ),
          ListTile(
            leading: SvgPicture.asset(
              IconStringConstants.discuss,
              colorFilter: const ColorFilter.mode(
                LegalReferralColors.buttonPrimary,
                BlendMode.srcIn,
              ),
            ),
            title: const Text('Discussion'),
            onTap: () {
              context.pop();
              context.pushNamed(
                CreateDiscussionPage.name,
              );
            },
          ),
          Divider(
            height: 1,
            color: Colors.grey.shade200,
          ),
          ListTile(
            leading: SvgPicture.asset(
              IconStringConstants.poll,
              colorFilter: const ColorFilter.mode(
                LegalReferralColors.buttonPrimary,
                BlendMode.srcIn,
              ),
            ),
            title: const Text('Poll'),
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
