// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
// import 'package:legal_referral_ui/src/core/config/config.dart';
// import 'package:legal_referral_ui/src/core/constants/constants.dart';
// import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';

// class DiscussionAudienceDialog extends StatefulWidget {
//   const DiscussionAudienceDialog({super.key});

//   @override
//   State<DiscussionAudienceDialog> createState() =>
//       _DiscussionAudienceDialogState();
// }

// class _DiscussionAudienceDialogState extends State<DiscussionAudienceDialog>{
//   final _discussionBloc = getIt<DiscussionBloc>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return BlocBuilder<DiscussionBloc, DiscussionState>(
//       bloc: _discussionBloc,
//       builder: (context, state) {
//         if (state.status == DiscussionStatus.loading) {
//           return const CustomLoadingIndicator();
//         }

//         final users = state.users;

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 20.h),
//             Row(
//               children: [
//                 Text(
//                   'Select Attorneys to Send Referral',
//                   style: textTheme.headlineSmall,
//                 ),
//                 const Spacer(),
//                 CustomIconButton(
//                   onTap: () {
//                     context.pop();
//                   },
//                   icon: const Icon(Icons.close_rounded),
//                 ),
//               ],
//             ),
//             SizedBox(height: 4.h),
//             CheckboxListTile(
//               // value: state.selectedUsers.length == users.length,
//               value: false,
//               checkColor: LegalReferralColors.textBlack,
//               fillColor: WidgetStateProperty.all(Colors.transparent),
//               onChanged: (value) {
//                 // _refferralBloc.add(
//                 //   AllUsersSelected(),
//                 // );
//               },
//               title: Text(
//                 'Select all',
//                 style: textTheme.bodyLarge,
//               ),
//               controlAffinity: ListTileControlAffinity.leading,
//               contentPadding: EdgeInsets.zero,
//             ),
//             SizedBox(height: 4.h),
//             Expanded(
//               child: ListView.separated(
//                 // itemCount: users.length,
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   // final user = users[index];
//                   // final isSelected = state.selectedUsers.contains(user);
//                   return GestureDetector(
//                     onTap: () {
//                       // if (user != null) {
//                       //   _refferralBloc.add(
//                       //     UserSelected(
//                       //       user: user,
//                       //     ),
//                       //   );
//                       // }
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 4.h),
//                       child: Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(24.r),
//                             ),
//                             child:
//                                 // isSelected
//                                 // ? const _CircularCheckBox()
//                                 // :
//                                 CustomAvatar(
//                               // imageUrl: user?.avatarUrl,
//                               imageUrl: null,
//                               radius: 24.r,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 8.w,
//                           ),
//                           Text(
//                             // '${user?.firstName} ${user?.lastName}',
//                             'Test User',
//                             style: textTheme.titleMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 separatorBuilder: (context, index) => const Divider(),
//               ),
//             ),
//             SizedBox(
//               height: 16.h,
//             ),
//             CustomElevatedButton(
//               text: 'Post referral',
//               onTap: () {
//                 // final selectedUsers = state.selectedUsers;
//                 // if (selectedUsers.isNotEmpty) {
//                 //   final selectedUsersIds = <String>[];
//                 //   for (final user in selectedUsers) {
//                 //     if (user?.userId != null) {
//                 //       selectedUsersIds.add(user!.userId!);
//                 //     }
//                 //   }

//                 //   final referral = widget.addReferralReq.copyWith(
//                 //     referredUserIds: selectedUsersIds,
//                 //   );

//                 //   _refferralBloc.add(
//                 //     ReferralCreated(
//                 //       referral: referral,
//                 //     ),
//                 //   );
//                 // } else {
//                 //   ToastUtil.showToast(
//                 //     context,
//                 //     title: 'Error',
//                 //     description: 'Please select at least one connection',
//                 //     type: ToastificationType.error,
//                 //   );
//                 // }
//               },
//             ),
//             SizedBox(
//               height: 16.h,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
