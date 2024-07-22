import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class DiscussionInvitesPage extends StatefulWidget {
  const DiscussionInvitesPage({super.key});

  static const String name = 'DiscussionInvitesPage';

  @override
  State<DiscussionInvitesPage> createState() => _DiscussionInvitesPageState();
}

class _DiscussionInvitesPageState extends State<DiscussionInvitesPage> {
  final _authBloc = getIt<AuthBloc>();
  final _discussionBloc = getIt<DiscussionBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;

    if (userId != null) {
      _discussionBloc.add(
        DiscussionInvitesFetched(userId: userId),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invites',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocConsumer<DiscussionBloc, DiscussionState>(
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
          if (state.status == DiscussionStatus.loading) {
            return const CircularProgressIndicator();
          }

          return ListView.separated(
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
          );
        },
      ),
    );
  }
}
