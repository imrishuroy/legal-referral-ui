import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/activity_widget.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/custom_card.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/featured_section.dart';
import 'package:toastification/toastification.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String name = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileBloc = getIt<ProfileBloc>();
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      AppLogger.info('Fetching profile for user: $userId');
      _profileBloc.add(ProfileFetched(userId: userId));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        listener: (context, state) {
          if (state.profileStatus == ProfileStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          final user = state.userProfile;

          return state.profileStatus == ProfileStatus.loading
              ? const ProfileShimmer()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        ColoredBox(
                          color: LegalReferralColors.containerWhite500,
                          child: Column(
                            children: [
                              HeaderSection(
                                user: user,
                                profileBloc: _profileBloc,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${user?.firstName ?? 'N/A'} '
                                      '${user?.lastName}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                    Text(
                                      user?.practiceArea ?? 'N/A',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color:
                                                LegalReferralColors.textGrey400,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          ImageStringConstants.favIcon,
                                        ),
                                        Text(
                                          '4.3 by 433 attorneys',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: LegalReferralColors
                                                    .textGrey400,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '898 Followers • 233 Connections',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color:
                                                LegalReferralColors.textBlue100,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        PricingSection(
                          user: user,
                          profileBloc: _profileBloc,
                        ),
                        CustomCard(
                          onTap: () {
                            context.pushNamed(
                              AddUpdatePricePage.name,
                              extra: AddUpdatePricePageArgs(
                                profileBloc: _profileBloc,
                              ),
                            );
                          },
                          title: 'Average billing per client',
                          visibility: false,
                          child: Text.rich(
                            TextSpan(
                              text: user?.averageBillingPerClient == null
                                  ? 'N/A'
                                  : '\$${user?.averageBillingPerClient}',
                              style: Theme.of(context).textTheme.displaySmall,
                              children: <TextSpan>[
                                TextSpan(
                                  text: user?.averageBillingPerClient == null
                                      ? ''
                                      : '/hr',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomCard(
                          onTap: () {},
                          visibility: false,
                          title: 'Case resolution rate',
                          child: Text(
                            user?.caseResolutionRate == null
                                ? 'N/A'
                                : '${user?.caseResolutionRate}%',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        CustomCard(
                          onTap: () {},
                          title: 'About',
                          visibility: false,
                          child: Text(
                            user?.about ?? 'N/A',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        ProfileSocialSection(
                          profileBloc: _profileBloc,
                        ),
                        const FeaturedSection(),
                        CustomCard(
                          onTap: () {},
                          title: 'Activity',
                          visibility: false,
                          child: const ActivityWidget(),
                        ),
                        ExperienceSection(
                          profileBloc: _profileBloc,
                        ),
                        EducationSection(
                          profileBloc: _profileBloc,
                        ),
                        const ReviewsSection(),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
