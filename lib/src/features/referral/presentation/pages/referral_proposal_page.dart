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
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ReferralProposalPageArgs {
  ReferralProposalPageArgs({
    this.project,
    this.referredUser,
  });
  final Project? project;
  final ReferedUser? referredUser;
}

class ReferralProposalPage extends StatefulWidget {
  const ReferralProposalPage({
    required this.args,
    super.key,
  });

  final ReferralProposalPageArgs args;
  static const name = 'ReferralProposalPage';

  @override
  State<ReferralProposalPage> createState() => _ReferralProposalPageState();
}

class _ReferralProposalPageState extends State<ReferralProposalPage> {
  final _referralBloc = getIt<ReferralBloc>();

  @override
  void initState() {
    final projectId = widget.args.project?.projectId;
    if (projectId != null) {
      _referralBloc.add(
        ProposalFetched(
          userId: widget.args.referredUser?.userId ?? '',
          projectId: projectId,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.args.project?.title ?? '',
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
          } else if (state.status == ReferralStatus.awardProject) {
            context.goNamed(ReferralPage.name, extra: 1);
          }
        },
        builder: (context, state) {
          if (state.status == ReferralStatus.loading) {
            return const CustomLoadingIndicator();
          }

          final name = '${widget.args.referredUser?.firstName ?? ''} '
              '${widget.args.referredUser?.lastName ?? ''}';

          final proposal = state.proposal;

          return ColoredBox(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (proposal?.status == ProposalStatus.rejected)
                  _DeclinedOfferNotification(name: name),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.proposal?.proposal != null)
                          Text(
                            state.proposal?.proposal ?? '',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        if (state.proposal?.proposal != null) const Divider(),
                        if (state.proposal?.proposal != null)
                          const SizedBox(height: 12),
                        Row(
                          children: [
                            CustomAvatar(
                              imageUrl:
                                  widget.args.referredUser?.avatarUrl ?? '',
                              radius: 24,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  widget.args.referredUser?.practiceArea ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            if (proposal?.status == ProposalStatus.active)
                              Expanded(
                                child: CustomOutlinedButton(
                                  width: 96.w,
                                  height: 48.h,
                                  textColor: LegalReferralColors.textBlue100,
                                  borderColor:
                                      LegalReferralColors.borderBlue300,
                                  onPressed: _projectAwarded,
                                  text: 'Award',
                                ),
                              ),
                            if (proposal?.status == ProposalStatus.active)
                              SizedBox(
                                width: 8.w,
                              ),
                            Expanded(
                              child: CustomOutlinedButton(
                                width: 96.w,
                                height: 48.h,
                                textColor: LegalReferralColors.textBlue100,
                                borderColor: LegalReferralColors.borderBlue300,
                                onPressed: _onTapMessage,
                                text: 'Message',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                      ],
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

  void _projectAwarded() {
    final projectId = widget.args.project?.projectId;
    final referredUserId = widget.args.referredUser?.userId;

    if (projectId == null || referredUserId == null) {
      return;
    }

    final req = AwardProjectReq(
      projectId: projectId,
      referredUserId: referredUserId,
    );
    _referralBloc.add(
      ProjectAwarded(
        awardProjectReq: req,
      ),
    );
  }

  void _onTapMessage() {
    final authBloc = getIt<AuthBloc>();
    final currentUserId = authBloc.state.user?.userId;
    final referredUserId = widget.args.referredUser?.userId;

    if (currentUserId == null || referredUserId == null) {
      return;
    }
    context.pushNamed(
      ChatMessagesPage.name,
      pathParameters: {
        'recipientId': referredUserId,
      },
    );
  }
}

class _DeclinedOfferNotification extends StatelessWidget {
  const _DeclinedOfferNotification({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 32.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 4.h,
          ),
          color: const Color(0XFFFF6464),
          alignment: Alignment.centerLeft,
          child: Text(
            '$name has declined your offer',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: LegalReferralColors.white,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 4.h,
          ),
          child: const Divider(),
        ),
      ],
    );
  }
}
