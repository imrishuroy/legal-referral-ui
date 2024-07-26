import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class DiscussionInvites extends StatefulWidget {
  const DiscussionInvites({super.key});

  @override
  State<DiscussionInvites> createState() => _DiscussionInvitesState();
}

class _DiscussionInvitesState extends State<DiscussionInvites> {
  final _authBloc = getIt<AuthBloc>();
  final _discussionBloc = getIt<DiscussionBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _discussionBloc.add(DiscussionInvitesFetched(userId: userId));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discussion Invites',
                style: textTheme.headlineLarge,
              ),
              CustomTextButton(
                onPressed: () => context.pushNamed(DiscussionInvitesPage.name),
                text: 'View all',
                style: textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        BlocConsumer<DiscussionBloc, DiscussionState>(
          bloc: _discussionBloc,
          listener: (context, state) {
            if (state.status == DiscussionStatus.failure) {
              ToastUtil.showToast(
                context,
                title: 'Error',
                description: state.failure?.message ?? 'something went wrong',
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            if (state.status == DiscussionStatus.success) {
              if (state.discussionInvites.isEmpty) {
                return const Expanded(
                  child: EmptyListWidget(
                    message: 'No discussion invites found',
                  ),
                );
              }

              return Expanded(
                child: ListView.separated(
                  itemCount: state.discussionInvites.length,
                  itemBuilder: (context, index) {
                    final discussionInviteRes = state.discussionInvites[index];

                    return DiscussionInviteTile(
                      discussionInviteRes: discussionInviteRes,
                      onJoin: () {
                        final discussionId =
                            discussionInviteRes?.discussion.discussionId;

                        if (discussionId != null) {
                          _discussionBloc.add(
                            DiscussionJoined(
                              discussionId: discussionId,
                            ),
                          );
                        }
                      },
                      onReject: () {
                        final discussionId =
                            discussionInviteRes?.discussion.discussionId;

                        if (discussionId != null) {
                          _discussionBloc.add(
                            DiscussionRejected(
                              discussionId: discussionId,
                            ),
                          );
                        }
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 12.h,
                    );
                  },
                ),
              );
            }

            return const CustomLoadingIndicator();
          },
        ),
      ],
    );
  }
}
