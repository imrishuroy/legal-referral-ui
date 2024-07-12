import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/discussion/data/data.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _discussionTextController = TextEditingController();
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

    _discussionTextController.text = widget.discussion.topic ?? '';

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
      body: BlocConsumer<DiscussionBloc, DiscussionState>(
        bloc: _discussionBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == DiscussionStatus.loading) {
            return const CustomLoadingIndicator();
          }
          final participants = state.discussionParticipants;

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 24.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  color: LegalReferralColors.backgroundWhite255,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            onPressed: () {
                              if (state.discussionUpdateToggle) {
                                _updateDiscussionTopic();
                              } else {
                                _discussionBloc
                                    .add(const DiscussionUpdateToggled());
                              }
                            },
                            text:
                                state.discussionUpdateToggle ? 'Save' : 'Edit',
                            style: textTheme.bodyLarge?.copyWith(
                              color: LegalReferralColors.textGrey400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      if (state.discussionUpdateToggle)
                        CustomTextField(
                          controller: _discussionTextController,
                          hintText: 'Enter Topic',
                        )
                      else
                        Text(
                          // widget.discussion.topic ?? '',
                          _discussionTextController.text,
                          style: textTheme.headlineMedium,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    color: LegalReferralColors.backgroundWhite255,
                    child: Expanded(
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
                              // shareToConnections(context);
                              _chooseConnection(
                                selectedAudience: DiscussionAudience.connected,
                              );
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
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _chooseConnection({
    required DiscussionAudience selectedAudience,
  }) {
    CustomBottomSheet.show(
      borderRadius: true,
      maxWidth: double.infinity,
      isDismissible: true,
      context: context,
      child: BlocBuilder<DiscussionBloc, DiscussionState>(
        bloc: _discussionBloc,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Invite Participants',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 8.h,
              ),
              RadioListTile<DiscussionAudience>(
                activeColor: LegalReferralColors.borderBlue100,
                title: Text(
                  'Anyone',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                value: DiscussionAudience.anyone,
                groupValue: state.audience,
                onChanged: (DiscussionAudience? value) {
                  if (value != null) {
                    _discussionBloc.add(
                      const DiscussionAudienceSelected(
                        audience: DiscussionAudience.anyone,
                      ),
                    );
                  }
                },
              ),
              const Divider(
                height: 1,
              ),
              RadioListTile<DiscussionAudience>(
                activeColor: LegalReferralColors.borderBlue100,
                value: DiscussionAudience.connected,
                groupValue: state.audience,
                title: Text(
                  'Connection only',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onChanged: (value) {
                  if (value != null) {
                    _discussionBloc.add(
                      const DiscussionAudienceSelected(
                        audience: DiscussionAudience.connected,
                      ),
                    );
                  }
                },
              ),
              const Divider(
                height: 1,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomOutlinedButton(
                textColor: LegalReferralColors.borderBlue100,
                borderColor: LegalReferralColors.borderBlue100,
                height: 57,
                text: 'Done',
                onPressed: () {
                  context.pop();
                  CustomBottomSheet.show(
                    borderRadius: true,
                    maxWidth: double.infinity,
                    context: context,
                    child: SizedBox(
                      height: 624.h,
                      child: DiscussionUserSelection(
                        audience: state.audience,
                        discussionBloc: _discussionBloc,
                        discussionId: widget.discussion.discussionId,
                        fetchUninvitedUsers: true,
                        onDone: () {
                          context.pop();
                          // _discussionBloc.add(Discussion)
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          );
        },
      ),
    );
  }

  void _updateDiscussionTopic() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final topic = _discussionTextController.text;
    final discussionId = widget.discussion.discussionId;
    if (discussionId != null) {
      _discussionBloc.add(
        DiscussionTopicUpdated(
          discussionId: discussionId,
          updateDiscussionTopicReq: UpdateDiscussionTopicReq(
            discussionId: discussionId,
            topic: topic,
          ),
        ),
      );
    }
  }
}
