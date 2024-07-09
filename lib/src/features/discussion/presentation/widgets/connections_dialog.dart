import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

//! Rishu this connnection is universion used in many places like
//! Referral,Discussion,HomePage Share,Group chat participants

void shareToConnections(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  CustomBottomSheet.show(
    borderRadius: true,
    maxWidth: double.infinity,
    context: context,
    child: SizedBox(
      height: 624.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              Text(
                'Select Attorneys to Send Referral',
                style: textTheme.headlineSmall,
              ),
              const Spacer(),
              CustomIconButton(
                onTap: () {
                  context.pop();
                },
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          CheckboxListTile(
            // value: state.selectedUsers.length == users.length,
            value: false,
            checkColor: LegalReferralColors.textBlack,
            fillColor: WidgetStateProperty.all(Colors.transparent),
            onChanged: (value) {
              // _refferralBloc.add(
              //   AllUsersSelected(),
              // );
            },
            title: Text(
              'Select all',
              style: textTheme.bodyLarge,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          SizedBox(height: 4.h),
          Expanded(
            child: ListView.separated(
              // itemCount: users.length,
              itemCount: 10,
              itemBuilder: (context, index) {
                // final user = users[index];
                // final isSelected = state.selectedUsers.contains(user);
                return GestureDetector(
                  onTap: () {
                    // if (user != null) {
                    //   _refferralBloc.add(
                    //     UserSelected(
                    //       user: user,
                    //     ),
                    //   );
                    // }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child:
                              // isSelected
                              // ? const _CircularCheckBox()
                              // :
                              CustomAvatar(
                            // imageUrl: user?.avatarUrl,
                            imageUrl: null,
                            radius: 24.r,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          // '${user?.firstName} ${user?.lastName}',
                          'Test User',
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomElevatedButton(
            text: 'Post referral',
            onTap: () {
              // final selectedUsers = state.selectedUsers;
              // if (selectedUsers.isNotEmpty) {
              //   final selectedUsersIds = <String>[];
              //   for (final user in selectedUsers) {
              //     if (user?.userId != null) {
              //       selectedUsersIds.add(user!.userId!);
              //     }
              //   }

              //   final referral = widget.addReferralReq.copyWith(
              //     referredUserIds: selectedUsersIds,
              //   );

              //   _refferralBloc.add(
              //     ReferralCreated(
              //       referral: referral,
              //     ),
              //   );
              // } else {
              //   ToastUtil.showToast(
              //     context,
              //     title: 'Error',
              //     description: 'Please select at least one connection',
              //     type: ToastificationType.error,
              //   );
              // }
            },
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    ),
  );
}

// class _CircularCheckBox extends StatelessWidget {
//   const _CircularCheckBox();

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       backgroundColor: LegalReferralColors.containerBlue79,
//       radius: 24.r,
//       child: const Icon(
//         Icons.done_rounded,
//         color: Colors.white,
//       ),
//     );
//   }
// }
