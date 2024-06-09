import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/pages/group_chat_page.dart';

class ActiveTab extends StatelessWidget {
  const ActiveTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 1.h,
            ),
            elevation: 1,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  DiscussionChatScreen(
                    discussionTitle: lorem20,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 4, right: 2),
                child: Text(
                  lorem20,
                  style: textTheme.bodyLarge,
                ),
              ),
              subtitle: Text(
                '44 active members',
                style: textTheme.bodyLarge
                    ?.copyWith(color: LegalReferralColors.textGrey400),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ),
                ),
                child: const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 50,
      ),
    );
  }
}

String lorem20 = 'Lorem ipsum dolor sit amet,'
    ' consectetur adipiscing elit.'
    ' Phasellus imperdiet, nulla et dictum interdum, '
    'nisi lorem.';
