import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/search/domain/domain.dart';
import 'package:legal_referral_ui/src/features/search/presentation/bloc/search_bloc.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';

const List<PopularSearch> _popularSearches = [
  PopularSearch(query: 'Finance Attorney', count: 100, location: 'Texas'),
  PopularSearch(query: 'Real Estate Attorney', count: 80, location: 'Arizona'),
  PopularSearch(query: 'Corporate Attorney', count: 60, location: 'Texas'),
];

class RecentSearchWidget extends StatefulWidget {
  const RecentSearchWidget({
    required this.searchBloc,
    super.key,
  });

  final SearchBloc searchBloc;

  @override
  State<RecentSearchWidget> createState() => _RecentSearchWidgetState();
}

class _RecentSearchWidgetState extends State<RecentSearchWidget> {
  @override
  void initState() {
    widget.searchBloc.add(SearchHistoryFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: widget.searchBloc,
      builder: (context, state) {
        return Container(
          color: LegalReferralColors.containerWhite500,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          margin: EdgeInsets.symmetric(vertical: 8.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.searchUsersHistories.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: LegalReferralColors.textGrey400),
                      ),
                      CustomTextButton(
                        textColor: LegalReferralColors.textGrey400,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400,
                        text: 'Clear',
                        onPressed: () async =>
                            SharedPrefs.clearUserSearchHistoty(),
                      ),
                    ],
                  ),
                if (state.searchUsersHistories.isNotEmpty)
                  SizedBox(
                    height: 12.h,
                  ),
                if (state.searchUsersHistories.isNotEmpty)
                  SizedBox(
                    height: 110.h,
                    child: ListView.builder(
                      itemCount: state.searchUsersHistories.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final user = state.searchUsersHistories[index];
                        return SizedBox(
                          width: 60.w,
                          child: VerticalTile(
                            onPressed: () {
                              final userId = user?.userId;
                              debugPrint('userId: $userId');
                              if (userId != null) {
                                context.pushNamed(
                                  ProfilePage.name,
                                  pathParameters: {
                                    'userId': userId,
                                  },
                                );
                              }
                            },
                            leading: CustomAvatar(
                              imageUrl: user?.avatarUrl,
                              radius: 28.r,
                            ),
                            trailing: Column(
                              children: [
                                Text(
                                  user?.firstName ?? '',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        height: 1.2,
                                      ),
                                ),
                                Text(
                                  user?.lastName ?? '',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        height: 0.8,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (state.searchUsersHistories.isNotEmpty)
                  SizedBox(
                    height: 26.h,
                  ),
                ListView.separated(
                  itemCount: state.searchQueryHistories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final query = state.searchQueryHistories[index];
                    return ListTile(
                      title: Text(
                        query,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      leading: SvgPicture.asset(
                        IconStringConstants.historyIcon,
                      ),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(vertical: -4),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: LegalReferralColors.borderGrey300,
                    );
                  },
                ),
                if (state.searchQueryHistories.isNotEmpty)
                  SizedBox(height: 24.h),
                Text(
                  'Popular search',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: LegalReferralColors.textGrey400),
                ),
                SizedBox(height: 22.h),
                ListView.separated(
                  itemCount: _popularSearches.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final search = _popularSearches[index];
                    return ListTile(
                      title: Text(
                        search.query,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        search.location,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: LegalReferralColors.textGrey400,
                            ),
                      ),
                      leading: SvgPicture.asset(
                        IconStringConstants.historyIcon,
                      ),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(vertical: -4),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: LegalReferralColors.borderGrey300,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
