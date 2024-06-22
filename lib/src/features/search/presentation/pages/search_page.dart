import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const String name = 'Searchpage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBloc = getIt<SearchBloc>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        searchController: _searchController,
        onChanged: (value) {
          if (value != null) {
            _searchBloc.add(
              UserSearched(
                query: value,
                limit: 10,
                offset: 1,
              ),
            );
          }
          return null;
        },
        onSubmitted: (value) {
          if (value != null) {
            SharedPrefs.addSearchQueryHistory(query: value);
            _searchBloc.add(
              UserSearched(
                query: value,
                limit: 10,
                offset: 1,
              ),
            );
          }
          return null;
        },
        appBarHeight: kToolbarHeight + 64.h,
        bottom: BlocBuilder<SearchBloc, SearchState>(
          bloc: _searchBloc,
          builder: (context, state) {
            return SizedBox(
              height: 50.h,
              child: ListView.builder(
                itemCount: searchFilters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 8.w,
                    ),
                    child: CustomChip(
                      label: searchFilters[index],
                      isSelected: searchFilters[index] == state.selectedFilter,
                      onTap: () {
                        _searchBloc.add(
                          SearchFilterSelected(
                            filter: searchFilters[index],
                          ),
                        );
                        _searchBloc.add(
                          UserSearched(
                            query: _searchController.text,
                            limit: 10,
                            offset: 1,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      body: BlocConsumer<SearchBloc, SearchState>(
        bloc: _searchBloc,
        listener: (context, state) {
          if (state.status == SearchStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'Something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.status == SearchStatus.loading) {
            return const SearchResultShimmer();
          }

          if (!state.isSearching) {
            return RecentSearchWidget(
              searchBloc: _searchBloc,
            );
          }

          final searchUsers = state.searchUsers;
          if (state.isSearching && searchUsers.isEmpty) {
            return const SearchEmptyWidget();
          }
          return ColoredBox(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: LegalReferralColors.containerBlue50,
                  thickness: 4.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'People',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: LegalReferralColors.textGrey400,
                                ),
                      ),
                      SizedBox(height: 4.h),
                      SizedBox(
                        height: 50.h,
                        child: ListView.builder(
                          itemCount: peopleFilters.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                right: 8.w,
                              ),
                              child: CustomChip(
                                label: peopleFilters[index],
                                isSelected: peopleFilters[index] ==
                                    state.selectedPeopleFilter,
                                onTap: () {
                                  _searchBloc.add(
                                    PeopleFilterSelected(
                                      filter: peopleFilters[index],
                                    ),
                                  );
                                  _searchBloc.add(
                                    UserSearched(
                                      query: _searchController.text,
                                      limit: 10,
                                      offset: 1,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.status == SearchStatus.loading)
                  const Center(
                    child: CustomLoadingIndicator(),
                  )
                else
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.searchUsers.length,
                      itemBuilder: (context, index) {
                        final user = state.searchUsers[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: ListTile(
                            onTap: () async {
                              if (user != null && user.userId != null) {
                                await SharedPrefs.addUserSearchHistory(
                                  appUser: user,
                                );
                                if (context.mounted) {
                                  await context.pushNamed(
                                    ProfilePage.name,
                                    pathParameters: {'userId': user.userId!},
                                  );
                                }
                              }
                            },
                            title: Text('${user?.firstName} ${user?.lastName}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user?.practiceArea ?? ''),
                                Text(user?.practiceLocation ?? ''),
                              ],
                            ),
                            leading: CustomAvatar(
                              imageUrl: user?.avatarUrl,
                              radius: 22,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Divider(),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
