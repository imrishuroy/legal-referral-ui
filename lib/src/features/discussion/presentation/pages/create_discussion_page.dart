import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/data/data.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

enum PostCondition { anyone, connectionOnly }

class CreateDiscussionPage extends StatefulWidget {
  const CreateDiscussionPage({super.key});
  static const name = 'CreateDiscussionPage';

  @override
  State<CreateDiscussionPage> createState() => _CreateDiscussionPageState();
}

class _CreateDiscussionPageState extends State<CreateDiscussionPage> {
  final TextEditingController _postContentController = TextEditingController();

  final _authBloc = getIt<AuthBloc>();
  final _discussionBloc = getIt<DiscussionBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiscussionBloc, DiscussionState>(
      bloc: _discussionBloc,
      listener: (context, state) {
        if (state.status == DiscussionStatus.failure) {
          ToastUtil.showToast(
            context,
            title: 'Error',
            description: state.failure?.message ?? 'something went wrong',
            type: ToastificationType.error,
          );
        } else if (state.status == DiscussionStatus.discussionCreated) {
          ToastUtil.showToast(
            context,
            title: 'Success',
            description: 'Post created successfully',
            type: ToastificationType.success,
          );
          context.pushReplacementNamed(FeedsPage.name);
        }
      },
      builder: (context, state) {
        final invitedUsers = <String>[];
        for (final item in state.selectedUsers) {
          if (item?.userId != null) {
            invitedUsers.add(item!.userId!);
          }
        }
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: CustomElevatedButton(
              text: 'Start Discussion',
              onTap: () {
                final userId = _authBloc.state.user?.userId;
                if (userId != null) {
                  _discussionBloc.add(
                    DiscussionCreated(
                      createDiscussionReq: CreateDiscussionReq(
                        authorId: userId,
                        topic: _postContentController.text,
                        invitedUserIds: invitedUsers,
                      ),
                    ),
                  );
                }
              },
              isLoading: state.status == DiscussionStatus.loading,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomAvatar(
                        imageUrl: _authBloc.state.user?.avatarUrl,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      TextButton.icon(
                        onPressed: () => _chooseConnection(
                          selectedAudience: state.audience,
                        ),
                        label: Text(
                          state.audience == DiscussionAudience.anyone
                              ? 'Anyone'
                              : 'Connection only',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 24.sp,
                        ),
                        iconAlignment: IconAlignment.end,
                      ),
                      const Spacer(),
                      SvgButton(
                        imagePath: IconStringConstants.cross2,
                        onPressed: () => context.pop(),
                        height: 24.h,
                        width: 24.w,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextField(
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            fillColor: Colors.transparent,
                            borderColor: Colors.transparent,
                            controller: _postContentController,
                            hintText: 'Discuss on...',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
                'Start your discussion with',
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
}
