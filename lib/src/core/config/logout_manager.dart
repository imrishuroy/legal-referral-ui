import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/router/router.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';

class LogoutManager {
  factory LogoutManager() => LogoutManager._internal();
  LogoutManager._internal();

  static Future<void> performLogout() async {
    final authBloc = getIt<AuthBloc>();
    authBloc.add(AuthSignOutRequested());

    final navigatorKeyContext =
        AppRouter().router.routerDelegate.navigatorKey.currentContext;

    if (navigatorKeyContext != null) {
      Navigator.of(navigatorKeyContext, rootNavigator: true).popUntil(
        (route) => route.isFirst,
      );
      await GoRouter.of(navigatorKeyContext).pushReplacement('/signin');
    }
  }
}
