import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

class WizardInspectionPage extends StatefulWidget {
  const WizardInspectionPage({super.key});

  static const name = 'WizardInspectionPage';

  @override
  State<WizardInspectionPage> createState() => _WizardInspectionPageState();
}

class _WizardInspectionPageState extends State<WizardInspectionPage> {
  final _authBloc = getIt<AuthBloc>();
  final _wizardBloc = getIt<WizardBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.id;
    if (userId != null) {
      debugPrint('User id: $userId');
      _wizardBloc.add(
        WizardStepFetched(
          userId: userId,
        ),
      );
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(state.failure?.message ?? 'something went wrong,'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.wizardStepStatus == WizardStepStatus.wizardStepLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          switch (state.wizardStep) {
            case WizardStep.contact:
              return ContactDetailsPage(
                wizardBloc: _wizardBloc,
              );
            case WizardStep.socialAvatar:
              return SocialAvatarPage(
                wizardBloc: _wizardBloc,
              );
            case WizardStep.license:
              return LicenseDetailPage(
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
