import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';
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
        path: '/feed',
        name: FeedsPage.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            child: FeedsPage(),
          ),
          transitionDuration: const Duration(
            milliseconds: 500,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
        routes: [
          GoRoute(
            path: 'comments',
            name: FeedDetailsPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: FeedDetailsPage(
                args: state.extra as FeedDetailsPageArgs,
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
                path: 'chat-messages/:recipientId',
                name: ChatMessagesPage.name,
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: ChatMessagesPage(
                    recipientId: state.pathParameters['recipientId']!,
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
        path: '/profile/:userId',
        name: ProfilePage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ProfilePage(
            userId: state.pathParameters['userId']!,
          ),
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
          child: RootLayout(
            currentIndex: 1,
            child: ReferralPage(
              tabIndex: state.extra as int?,
            ),
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
        routes: [
          GoRoute(
            path: 'project-details',
            name: ProjectDetailsPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: ProjectDetailsPage(
                //  project: state.extra as Project,
                args: state.extra as ProjectDetailsPageArgs,
              ),
              transitionDuration: const Duration(
                milliseconds: _routeTransitionDuration,
              ),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
            routes: [
              GoRoute(
                path: 'project-review',
                name: ProjectReviewPage.name,
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: ProjectReviewPage(
                    project: state.extra as Project,
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
          GoRoute(
            path: 'completed-project-details',
            name: CompletedProjectDetailsPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: CompletedProjectDetailsPage(
                project: state.extra as Project,
              ),
              transitionDuration: const Duration(
                milliseconds: _routeTransitionDuration,
              ),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
          ),
          GoRoute(
            path: 'referral-detail',
            name: ReferralDetailPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: ReferralDetailPage(
                project: state.extra as Project?,
              ),
              transitionDuration: const Duration(
                milliseconds: _routeTransitionDuration,
              ),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
            routes: [
              GoRoute(
                path: 'referral-proposal',
                name: ReferralProposalPage.name,
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: ReferralProposalPage(
                    args: state.extra as ReferralProposalPageArgs,
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
          GoRoute(
            path: 'proposal-details',
            name: ProposalDetailsPage.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) => CustomTransitionPage(
              child: ProposalDetailsPage(
                project: state.extra as Project?,
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
      GoRoute(
        path: '/add-referral',
        name: CreateReferralPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CreateReferralPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),

      // post

      GoRoute(
        path: '/addReferral',
        name: PostPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const RootLayout(
            currentIndex: 2,
            child: CreateReferralPage(),
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
      GoRoute(
        path: '/post',
        name: CreatePostPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CreatePostPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/discussion',
        name: CreateDiscussionPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CreateDiscussionPage(),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      GoRoute(
        path: '/discussion/:discussionId/messages',
        name: DiscussionChatsPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: DiscussionChatsPage(
            discussion: state.extra as Discussion,
          ),
          transitionDuration: const Duration(
            milliseconds: _routeTransitionDuration,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),

      GoRoute(
        path: '/discussion/details/:discussionId',
        name: DiscussionDetailsPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: DiscussionDetailsPage(
            discussion: state.extra as Discussion,
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
