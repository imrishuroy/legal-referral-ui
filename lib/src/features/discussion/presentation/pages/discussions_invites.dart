import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';

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
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const DiscussionInvitePage(),
                  //   ),
                  // );
                },
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
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == DiscussionStatus.loading) {
              return const CustomLoadingIndicator();
            }
            return Expanded(
              child: ListView.separated(
                itemCount: state.discussionInvites.length,
                itemBuilder: (context, index) {
                  return DiscussionInviteTile(
                    discussionInviteRes: state.discussionInvites[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12.h,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
