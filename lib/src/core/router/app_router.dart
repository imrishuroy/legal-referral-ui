import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'parent');

const _routeAnimationDuration = 1;

class AppRouter {
  GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: SplashPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SplashPage(),
          transitionDuration: const Duration(
            seconds: _routeAnimationDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/signin',
        name: SignInPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignInPage(),
          transitionDuration: const Duration(
            seconds: 2,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/signup',
        name: SignUpPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignUpPage(),
          transitionDuration: const Duration(
            seconds: 2,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/onboarding',
        name: OnBoardingScreen.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const OnBoardingScreen(),
          transitionDuration: const Duration(
            seconds: 2,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/home',
        name: HomePage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HomePage(),
          transitionDuration: const Duration(
            seconds: 2,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
    ],
  );
}
