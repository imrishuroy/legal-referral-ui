import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

class ConnectionLostPage extends StatelessWidget {
  const ConnectionLostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              ImageStringsUtil.noConnection,
              height: 200.h,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Something  went wrong',
            style: TextStyle(fontSize: 25.h),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Check you connection then refresh the page',
            style: TextStyle(fontSize: 14.h),
          ),
        ],
      ),
    );
  }
}
