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

class ProposalDetailsPage extends StatefulWidget {
  const ProposalDetailsPage({
    super.key,
    this.project,
  });

  final Project? project;
  static const String name = 'ProposalDetailsPage';

  @override
  State<ProposalDetailsPage> createState() => _ProposalDetailsPageState();
}

class _ProposalDetailsPageState extends State<ProposalDetailsPage> {
  final _authBloc = getIt<AuthBloc>();
  final _referralBloc = getIt<ReferralBloc>();
  final _proposalController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    final projectId = widget.project?.projectId;
    if (userId != null && projectId != null) {
      _referralBloc.add(
        ProposalFetched(
          userId: userId,
          projectId: projectId,
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
        elevation: 4.h,
        shadowColor: Colors.grey[100],
        title: Text(
          widget.project?.title ?? '',
          style: textTheme.headlineLarge,
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
          }
        },
        builder: (context, state) {
          if (state.status == ReferralStatus.loading) {
            return const CustomLoadingIndicator();
          }
          _proposalController.text = state.proposal?.proposal ?? '';
          final name = '${widget.project?.user?.firstName ?? ''} '
              '${widget.project?.user?.lastName ?? ''}';
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    color: LegalReferralColors.containerWhite500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: AttorneyDetails(
                                attorneyName: name,
                                attorneyType:
                                    '${widget.project?.user?.practiceArea} '
                                    '• 1st',
                                profileImage: widget.project?.user?.avatarUrl,
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
                          height: 12.h,
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HorizontalIconText(
                              icon: IconStringConstants.location,
                              title: widget.project?.practiceLocation,
                            ),
                            HorizontalIconText(
                              icon: IconStringConstants.calender,
                              title: DateTimeUtil.formatReferralDate(
                                widget.project?.createdAt,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        HorizontalIconText(
                          icon: IconStringConstants.bag,
                          title: widget.project?.practiceArea,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Divider(
                          height: 1,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          widget.project?.description ?? '',
                          style: textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    color: LegalReferralColors.containerWhite500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'My Proposal',
                              style: textTheme.headlineSmall,
                            ),
                            const Spacer(),
                            CustomTextButton(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              text: 'Edit',
                              onPressed: () => _referralBloc.add(
                                ProposalEditToggled(),
                              ),
                              textColor: LegalReferralColors.textBlue100,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        if (state.isProposalEditing)
                          CustomTextField(
                            keyboardType: TextInputType.multiline,
                            controller: _proposalController,
                            hintText: 'Write your proposal here',
                            minLines: 4,
                            maxLines: 4,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Proposal is required';
                              }
                              return null;
                            },
                          ),
                        if (!state.isProposalEditing)
                          Text(
                            state.proposal?.proposal ?? '',
                            style: textTheme.bodyLarge,
                          ),
                        if (state.proposal == null || state.isProposalEditing)
                          SizedBox(
                            height: 20.h,
                          ),
                        if (state.proposal == null || state.isProposalEditing)
                          CustomElevatedButton(
                            onTap: () => _sendProposal(
                              isUpdate: state.proposal != null,
                              proposalId: state.proposal?.proposalId,
                            ),
                            text: 'Send Proposal',
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _sendProposal({
    required bool isUpdate,
    required int? proposalId,
  }) {
    if (_formKey.currentState!.validate()) {
      final userId = _authBloc.state.user?.userId;
      final projectId = widget.project?.projectId;
      if (userId != null && projectId != null) {
        final proposalReq = Proposal(
          proposalId: proposalId,
          userId: userId,
          referralId: projectId,
          proposal: _proposalController.text,
          title: widget.project?.title,
        );
        if (isUpdate && proposalId != null) {
          _referralBloc.add(
            ProposalUpdated(
              proposalId: proposalId,
              proposal: proposalReq,
            ),
          );
        } else {
          _referralBloc.add(
            ProposalSent(proposal: proposalReq),
          );
        }
      }
    }
  }

  void _onTapMessage() {
    final authBloc = getIt<AuthBloc>();
    final currentUserId = authBloc.state.user?.userId;
    final referrerUserId = widget.project?.user?.userId;
    if (currentUserId == null || referrerUserId == null) {
      return;
    }
    context.pushNamed(
      ChatMessagesPage.name,
      pathParameters: {
        'recipientId': referrerUserId,
      },
    );
  }
}
