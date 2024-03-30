import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final user = _authBloc.state.user;

    switch (user?.wizardStep) {
      case 0:
        return const ContactDetailsPage();

      default:
        return const SizedBox();
    }
  }
}
