import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/account/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AccountInfoSection extends StatefulWidget {
  const AccountInfoSection({super.key});

  @override
  State<AccountInfoSection> createState() => _AccountInfoSectionState();
}

class _AccountInfoSectionState extends State<AccountInfoSection> {
  final _authBloc = getIt<AuthBloc>();
  final _accountBloc = getIt<AccountBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _accountBloc.add(AccountInfoFetched(userId: userId));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      bloc: _accountBloc,
      listener: (context, state) {
        if (state.status == AccountStatus.failure) {
          ToastUtil.showToast(
            context,
            title: 'Error',
            description: state.failure?.message ?? 'something went wrong',
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        if (state.status == AccountStatus.loading) {
          return const Center(child: AccountInfoSectionShimmer());
        }
        final accountInfo = state.accountInfo;
        final name = '${accountInfo?.firstName} ${accountInfo?.lastName}';
        final avgRating = accountInfo?.ratingInfo?.averageRating ?? 0;
        final totalAttorneys = accountInfo?.ratingInfo?.attorneys ?? 0;
        final attorneyLabel = totalAttorneys == 1 ? 'attorney' : 'attorneys';

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  final userId = _authBloc.state.user?.userId;
                  if (userId != null) {
                    context.pushNamed(
                      ProfilePage.name,
                      pathParameters: {
                        'userId': userId,
                      },
                    );
                  }
                },
                child: CustomAvatar(
                  imageUrl: accountInfo?.avatarUrl,
                  radius: 78.r,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                accountInfo?.practiceArea ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: LegalReferralColors.textGrey400,
                    ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  SvgPicture.asset(
                    IconStringConstants.rating,
                  ),
                  Text(
                    '$avgRating by '
                    '$totalAttorneys $attorneyLabel',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: LegalReferralColors.textGrey400,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                '${accountInfo?.followersCount ?? 0} Followers • '
                '${accountInfo?.connectionsCount ?? 0} Connections',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: LegalReferralColors.textBlue100,
                    ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }
}
