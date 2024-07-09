import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class BottomTextField extends StatelessWidget {
  const BottomTextField({
    required this.focusNode,
    required this.commentsController,
    required this.hintText,
    required this.onSend,
    required this.height,
    this.parentMessage,
    super.key,
  });

  final TextEditingController commentsController;
  final FocusNode focusNode;
  final String hintText;
  final String? parentMessage;
  final double height;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey,
      elevation: 4,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (parentMessage != null)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Repling to: '
                    '$parentMessage',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  // maxLines: 3,
                  // keyboardType: TextInputType.multiline,
                  // autofocus: true,
                  focusNode: focusNode,
                  hintText: hintText,
                  controller: commentsController,
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  IconStringConstants.send,
                  colorFilter: const ColorFilter.mode(
                    Colors.blue,
                    BlendMode.srcIn,
                  ),
                  height: 24.h,
                  width: 24.w,
                ),
                onPressed: onSend,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
