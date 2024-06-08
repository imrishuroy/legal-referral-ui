import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/pages/feeds_page.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class WizardInspectionPage extends StatefulWidget {
  const WizardInspectionPage({super.key});

  static const name = 'WizardInspectionPage';

  @override
  State<WizardInspectionPage> createState() => _WizardInspectionPageState();
}

class _WizardInspectionPageState extends State<WizardInspectionPage> {
  late final AuthBloc _authBloc;
  final _wizardBloc = getIt<WizardBloc>();

  @override
  void initState() {
    _authBloc = getIt<AuthBloc>();
    final user = _authBloc.state.user;

    AppLogger.info('User from wizard inspection page: $user');

    if (user?.userId != null) {
      if (user?.wizardCompleted ?? false) {
        context.goNamed(FeedsPage.name);
      } else {
        _wizardBloc.add(
          WizardStepFetched(
            userId: user!.userId!,
          ),
        );
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocConsumer<WizardBloc, WizardState>(
        bloc: _wizardBloc,
        listener: (context, state) {
          if (state.wizardStatus == WizardStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'Something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.wizardStepStatus == WizardStepStatus.wizardStepLoading) {
            return const Scaffold(
              backgroundColor: LegalReferralColors.primaryBackground,
              body: CustomLoadingIndicator(),
            );
          }

          switch (state.wizardStep) {
            case WizardStep.license:
              return LicenseDetailPage(
                wizardBloc: _wizardBloc,
              );

            case WizardStep.uploadLicense:
              return UploadLicensePage(
                wizardBloc: _wizardBloc,
              );

            case WizardStep.aboutYou:
              return ShareAboutYouPage(
                wizardBloc: _wizardBloc,
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
