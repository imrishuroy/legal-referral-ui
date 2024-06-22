import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/widgets/attorney_details.dart';

class CompletedProjectDetailsPage extends StatelessWidget {
  const CompletedProjectDetailsPage({
    super.key,
    this.project,
  });

  final Project? project;
  static const name = 'CompletedProjectDetailsPage';

  @override
  Widget build(BuildContext context) {
    final name = '${project?.user?.firstName} ${project?.user?.lastName}';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          project?.title ?? '',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: ColoredBox(
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
                      onPressed: () => _onTapMessage(context),
                      text: 'Message',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapMessage(BuildContext context) {
    final authBloc = getIt<AuthBloc>();
    final currentUserId = authBloc.state.user?.userId;
    final otherUserId = project?.user?.userId;
    if (currentUserId == null || otherUserId == null) {
      return;
    }
    context.pushNamed(
      ChatMessagesPage.name,
      pathParameters: {
        'recipientId': otherUserId,
      },
    );
  }
}
