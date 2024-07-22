import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';

class DiscussionUserSelection extends StatefulWidget {
  const DiscussionUserSelection({
    required this.audience,
    required this.discussionBloc,
    required this.onDone,
    this.fetchUninvitedUsers = false,
    this.discussionId,
    super.key,
  });

  final DiscussionAudience audience;
  final DiscussionBloc discussionBloc;
  final VoidCallback onDone;
  final bool fetchUninvitedUsers;
  final int? discussionId;

  @override
  State<DiscussionUserSelection> createState() =>
      _DiscussionUserSelectionState();
}

class _DiscussionUserSelectionState extends State<DiscussionUserSelection> {
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;

    if (userId != null) {
      if (widget.fetchUninvitedUsers && widget.discussionId != null) {
        widget.discussionBloc.add(
          DiscussionUninvitedUsersFetched(
            discussionId: widget.discussionId!,
          ),
        );
      }

      if (widget.audience == DiscussionAudience.connected) {
        widget.discussionBloc.add(
          UserConnectionsFetched(
            userId: userId,
            limit: 20,
            offset: 1,
          ),
        );
      } else {
        widget.discussionBloc.add(
          UsersFetched(
            userId: userId,
            limit: 20,
            offset: 1,
          ),
        );
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocConsumer<DiscussionBloc, DiscussionState>(
      bloc: widget.discussionBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == DiscussionStatus.loading) {
          return const CustomLoadingIndicator();
        }

        final users = state.users;

        return Column(
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
              value: state.selectedUsers.length == users.length,
              checkColor: LegalReferralColors.textBlack,
              fillColor: WidgetStateProperty.all(Colors.transparent),
              onChanged: (value) {
                widget.discussionBloc.add(
                  AllUsersSelected(),
                );
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
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final isSelected = state.selectedUsers.contains(user);
                  return GestureDetector(
                    onTap: () {
                      if (user != null) {
                        widget.discussionBloc.add(
                          UserSelected(
                            user: user,
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: isSelected
                                ? const CircularCheckBox()
                                : CustomAvatar(
                                    imageUrl: user?.avatarUrl,
                                    radius: 24.r,
                                  ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '${user?.firstName} ${user?.lastName}',
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
              text: 'Done',
              onTap: widget.onDone,
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        );
      },
    );
  }
}
