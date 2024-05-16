import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discuss/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';
import 'package:legal_referral_ui/src/features/network/presentation/pages/network_page.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/wizard/presentation/presentation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'parent');
const _scaffoldKey = ValueKey('_scaffoldKey');

const _routeAnimationDuration = 1;
const _routeTransitionDuration = 200;

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
        path: '/onboarding',
        name: OnBoardingPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const OnBoardingPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
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
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
        routes: [
          GoRoute(
            path: 'linkedin',
            name: LinkedinSignInPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const LinkedinSignInPage(),
              transitionDuration: const Duration(
                milliseconds: _routeTransitionDuration,
              ),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/signup',
        name: SignUpPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignUpPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/reset-password',
        name: ResetPasswordPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ResetPasswordPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/new-password/:email',
        name: NewPasswordPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: NewPasswordPage(
            email: state.pathParameters['email']!,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/contact-details',
        name: ContactDetailsPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ContactDetailsPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/social-avatar',
        name: SocialAvatarPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SocialAvatarPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/wizard',
        name: WizardInspectionPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const WizardInspectionPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/home',
        name: HomePage.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            child: HomePage(),
          ),
          transitionDuration: const Duration(
            milliseconds: 500,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/network',
        name: NetworkPage.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const RootLayout(
            key: _scaffoldKey,
            currentIndex: 3,
            child: NetworkPage(),
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
        routes: [
          GoRoute(
            path: 'connection',
            name: ConnectionPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const ConnectionPage(),
              transitionDuration: const Duration(
                milliseconds: _routeTransitionDuration,
              ),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
            routes: [
              GoRoute(
                path: 'connection-filter',
                name: ConnectionFilterPage.name,
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: const ConnectionFilterPage(),
                  transitionDuration: const Duration(
                    milliseconds: _routeTransitionDuration,
                  ),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              ),
            ],
          ),
          GoRoute(
            path: 'recommendation',
            name: RecommendationPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const RecommendationPage(),
              transitionDuration: const Duration(
                milliseconds: _routeTransitionDuration,
              ),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
          ),
          GoRoute(
            path: 'invites',
            name: InvitesPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const InvitesPage(),
              transitionDuration: const Duration(
                milliseconds: _routeTransitionDuration,
              ),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
          ),
          GoRoute(
            path: 'chat-rooms',
            name: ChatRoomsPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const ChatRoomsPage(),
              transitionDuration: const Duration(
                milliseconds: _routeTransitionDuration,
              ),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
            routes: [
              GoRoute(
                path: 'chat-messages',
                name: ChatMessagesPage.name,
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: ChatMessagesPage(
                    chatRoom: state.extra as ChatRoom,
                  ),
                  transitionDuration: const Duration(
                    milliseconds: _routeTransitionDuration,
                  ),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              ),
              GoRoute(
                path: 'user-connections',
                name: UserConnectionsPage.name,
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: UserConnectionsPage(
                    chatBloc: state.extra as ChatBloc,
                  ),
                  transitionDuration: const Duration(
                    milliseconds: _routeTransitionDuration,
                  ),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        name: ProfilePage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ProfilePage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/add-update-experience',
        name: AddUpdateExperiencePage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: AddUpdateExperiencePage(
            args: state.extra as AddUpdateExperiencePageArgs,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/list-experience',
        name: ListExperiencePage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ListExperiencePage(
            profileBloc: state.extra as ProfileBloc,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/search-firm',
        name: SearchFirmPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SearchFirmPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/update-info',
        name: UpdateUserInfoPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: UpdateUserInfoPage(
            profileBloc: state.extra as ProfileBloc,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/add-edit-price',
        name: AddUpdatePricePage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: AddUpdatePricePage(
            args: state.extra as AddUpdatePricePageArgs,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/add-update-social',
        name: AddUpdateSocialPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: AddUpdateSocialPage(
            arg: state.extra as AddUpdateSocialPageArgs,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/list-social',
        name: ListSocialPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ListSocialPage(
            profileBloc: state.extra as ProfileBloc,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/add-update-education',
        name: AddUpdateEducationPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: AddUpdateEducationPage(
            args: state.extra as AddUpdateEducationPageArgs,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/list-education',
        name: ListEducationPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ListEducationPage(
            profileBloc: state.extra as ProfileBloc,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/search',
        name: SearchPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SearchPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/camera',
        name: CameraPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: CameraPage(
            args: state.extra as CameraPageArgs,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      // referral
      GoRoute(
        path: '/referral',
        name: ReferralPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const RootLayout(
            currentIndex: 1,
            child: ReferralPage(),
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/add-referral',
        name: AddReferralPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const AddReferralPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),

      // post

      GoRoute(
        path: '/post',
        name: PostPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const RootLayout(
            currentIndex: 2,
            child: AddReferralPage(),
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),

      // discuss
      GoRoute(
        path: '/discuss',
        name: DiscussPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const RootLayout(
            currentIndex: 4,
            child: DiscussPage(),
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
    ],
    debugLogDiagnostics: true,
  );
}
