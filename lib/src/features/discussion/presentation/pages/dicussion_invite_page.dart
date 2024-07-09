import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscussionInvitePage extends StatelessWidget {
  const DiscussionInvitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invites',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        itemBuilder: (context, index) {
          return null;

          //   return  DiscussionInviteTile();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 8.h,
          );
        },
        itemCount: 30,
      ),
    );
  }
}
