import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ProjectDetailsPageArgs {
  ProjectDetailsPageArgs({
    required this.isReferrer,
    required this.project,
  });
  final bool isReferrer;
  final Project? project;
}

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({
    required this.args,
    super.key,
  });

  final ProjectDetailsPageArgs args;
  static const name = 'ProjectDetailsPage';

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  final _authBloc = getIt<AuthBloc>();
  final _referralBloc = getIt<ReferralBloc>();

  @override
  Widget build(BuildContext context) {
    final project = widget.args.project;
    final projectSartedOn = DateTimeUtil.formatProjectTime(project?.startedAt);

    final name = '${project?.user?.firstName} ${project?.user?.lastName}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          project?.title ?? '',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocConsumer<ReferralBloc, ReferralState>(
        bloc: _referralBloc,
        listener: (context, state) {
          if (state.status == ReferralStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          } else if (state.status == ReferralStatus.success) {
            context.pushNamed(
              ProjectReviewPage.name,
              extra: project,
            );
          } else if (state.status == ReferralStatus.initial) {
            context.pushReplacementNamed(ReferralPage.name);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 34.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 4.h,
                ),
                color: LegalReferralColors.containerGreen95,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Started on $projectSartedOn',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: LegalReferralColors.white,
                      ),
                ),
              ),
              SingleChildScrollView(
                child: ColoredBox(
                  color: LegalReferralColors.containerWhite500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project?.description ?? '',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        const Divider(
                          height: 1,
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: AttorneyDetails(
                                attorneyName: name,
                                attorneyType: project?.user?.practiceArea ?? '',
                                profileImage: project?.user?.avatarUrl,
                              ),
                            ),
                            Expanded(
                              child: CustomOutlinedButton(
                                width: 96.w,
                                height: 36.h,
                                textColor: LegalReferralColors.textBlue100,
                                borderColor: LegalReferralColors.borderBlue300,
                                onPressed: _onTapMessage,
                                text: 'Message',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        if (widget.args.project?.status ==
                                ProjectStatus.started ||
                            (widget.args.isReferrer &&
                                widget.args.project?.status ==
                                    ProjectStatus.completeInitiated))
                          Column(
                            children: [
                              CustomElevatedButton(
                                onTap: () => _completedAndReview(
                                  project: project,
                                  isReferrer: widget.args.isReferrer,
                                ),
                                text: 'Complete & Review',
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              if (widget.args.isReferrer)
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 12.h,
                                  ),
                                  child: CustomOutlinedButton(
                                    textColor: LegalReferralColors.textGrey400,
                                    borderColor:
                                        LegalReferralColors.borderGrey300,
                                    onPressed: () => _cancelCompleteInitiated(
                                      projectId: project?.projectId,
                                    ),
                                    text: 'Yet To be Done',
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onTapMessage() {
    final currentUserId = _authBloc.state.user?.userId;
    final otherUserId = widget.args.project?.user?.userId;
    if (currentUserId == null || otherUserId == null) {
      return;
    }
    context.pushNamed(
      ChatMessagesPage.name,
      pathParameters: {
        'recipientId':
            currentUserId != otherUserId ? otherUserId : currentUserId,
      },
    );
  }

  void _completedAndReview({
    required Project? project,
    required bool isReferrer,
  }) {
    final userId = _authBloc.state.user?.userId;
    final projectUserId = project?.user?.userId;
    final projectId = project?.projectId;
    if (userId == null || projectId == null || projectUserId == null) {
      return;
    }
    if (isReferrer) {
      // author of the project
      _referralBloc.add(
        ProjectCompleted(
          projectId: projectId,
        ),
      );
    } else {
      _referralBloc.add(
        ProjectCompletionInitiated(
          projectId: projectId,
        ),
      );
    }
  }

  void _cancelCompleteInitiated({
    required int? projectId,
  }) {
    if (projectId != null) {
      _referralBloc.add(
        ProjectCompletionInitiationCancelled(projectId: projectId),
      );
    }
  }
}
