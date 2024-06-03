import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class PostNavigationModelBottomSheet extends StatelessWidget {
  const PostNavigationModelBottomSheet({super.key});

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
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const CreateReferralPage(),
              ),
            ),
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
