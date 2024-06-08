import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 8.w,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => VerticalTile(
          onPressed: () {},
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: LegalReferralColors.borderGrey300,
                width: 1.w,
              ),
            ),
            child: CustomAvatar(
              imageUrl: null,
              radius: 36.r,
            ),
          ),
          trailing: Column(
            children: [
              Text(
                'First Name',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.2,
                    ),
              ),
              // Text(
              //   'Last Name',
              //   textAlign: TextAlign.center,
              //   style:
              //       Theme.of(context).textTheme.bodyLarge?
              // .copyWith(
              //             height: 0.8,
              //           ),
              // ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 10,
      ),
    );
  }
}
