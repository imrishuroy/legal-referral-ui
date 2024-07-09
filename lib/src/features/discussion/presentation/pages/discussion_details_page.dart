import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/widgets/connections_dialog.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class DiscussionDetailsPage extends StatefulWidget {
  const DiscussionDetailsPage({
    required this.discussion,
    super.key,
  });
  final Discussion discussion;

  static const String name = 'DiscussionDetailsPage';

  @override
  State<DiscussionDetailsPage> createState() => _DiscussionDetailsPageState();
}

class _DiscussionDetailsPageState extends State<DiscussionDetailsPage> {
  final _discussionBloc = getIt<DiscussionBloc>();

  @override
  void initState() {
    final discussionId = widget.discussion.discussionId;
    if (discussionId != null) {
      _discussionBloc.add(
        DiscussionParticipantsFetched(
          discussionId: discussionId,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 24.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            color: LegalReferralColors.backgroundWhite255,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Topic',
                      style: textTheme.headlineSmall?.copyWith(
                        color: LegalReferralColors.textGrey400,
                      ),
                    ),
                    CustomTextButton(
                      onPressed: () {},
                      text: 'Edit',
                      style: textTheme.bodyLarge?.copyWith(
                        color: LegalReferralColors.textGrey400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  widget.discussion.topic ?? '',
                  style: textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              color: LegalReferralColors.backgroundWhite255,
              child: BlocBuilder<DiscussionBloc, DiscussionState>(
                bloc: _discussionBloc,
                builder: (context, state) {
                  if (state.status == DiscussionStatus.loading) {
                    return const CustomLoadingIndicator();
                  }

                  final participants = state.discussionParticipants;
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${participants.length} participants',
                          style: textTheme.headlineSmall?.copyWith(
                            color: LegalReferralColors.textGrey400,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              final user = participants[index];
                              final name =
                                  '${user?.firstName} ${user?.lastName}';
                              return AttorneyDetails(
                                attorneyName: name,
                                attorneyType: user?.practiceArea,
                                profileImage: user?.avatarUrl,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                            itemCount: participants.length,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        HorizontalIconButton(
                          iconColor: LegalReferralColors.textBlue100,
                          style: textTheme.titleSmall?.copyWith(
                            color: LegalReferralColors.textBlue100,
                          ),
                          height: 20,
                          width: 20,
                          text: 'Invite Participants',
                          icon: IconStringConstants.addIcon,
                          onTap: () {
                            shareToConnections(context);
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        HorizontalIconButton(
                          iconColor: LegalReferralColors.textBlue100,
                          style: textTheme.titleSmall?.copyWith(
                            color: LegalReferralColors.textBlue100,
                          ),
                          width: 20,
                          height: 20,
                          text: 'Leave Discussion',
                          icon: IconStringConstants.subtract,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
