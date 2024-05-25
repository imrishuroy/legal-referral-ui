import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ProposalDetailsPage extends StatefulWidget {
  const ProposalDetailsPage({
    super.key,
    this.proposal,
  });

  final Proposal? proposal;
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
    final referralId = widget.proposal?.referralId;
    if (userId != null && referralId != null) {
      _referralBloc.add(
        ProposalFetched(
          userId: userId,
          referralId: referralId,
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
          widget.proposal?.title ?? '',
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
          _proposalController.text = state.proposalReq?.proposal ?? '';
          final name = '${widget.proposal?.referrerFirstName ?? ''} '
              '${widget.proposal?.referrerLastName ?? ''}';
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
                                    '${widget.proposal?.referrerPracticeArea} '
                                    '• 1st',
                                profileImage:
                                    widget.proposal?.referrerAvatarUrl,
                              ),
                            ),
                            Expanded(
                              child: CustomOutlinedButton(
                                width: 96.w,
                                height: 36.h,
                                textColor: LegalReferralColors.textBlue100,
                                borderColor: LegalReferralColors.borderBlue300,
                                onPressed: () {},
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
                              title: widget.proposal?.preferredPracticeLocation,
                            ),
                            HorizontalIconText(
                              icon: IconStringConstants.calender,
                              title: DateTimeUtil.formatReferralDate(
                                widget.proposal?.createdAt,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        HorizontalIconText(
                          icon: IconStringConstants.bag,
                          title: widget.proposal?.preferredPracticeArea,
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
                          widget.proposal?.caseDescription ?? '',
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
                            state.proposalReq?.proposal ?? '',
                            style: textTheme.bodyLarge,
                          ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomElevatedButton(
                          onTap: () => _sendProposal(
                            isUpdate: state.proposalReq != null,
                            proposalId: state.proposalReq?.proposalId,
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
      final referralId = widget.proposal?.referralId;
      if (userId != null && referralId != null) {
        final proposalReq = ProposalReq(
          proposalId: proposalId,
          userId: userId,
          referralId: referralId,
          proposal: _proposalController.text,
          title: widget.proposal?.title,
        );
        if (isUpdate && proposalId != null) {
          _referralBloc.add(
            ProposalUpdated(
              proposalId: proposalId,
              proposalReq: proposalReq,
            ),
          );
        } else {
          _referralBloc.add(
            ProposalSent(proposalReq: proposalReq),
          );
        }
      }
    }
  }
}
