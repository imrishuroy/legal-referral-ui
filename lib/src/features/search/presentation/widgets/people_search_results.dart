import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';

class PeopleSearchResults extends StatelessWidget {
  const PeopleSearchResults({
    required this.searchBloc,
    required this.searchController,
    super.key,
  });

  final SearchBloc searchBloc;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final state = searchBloc.state;
    final users = searchBloc.state.users;
    if (state.isSearching && users.isEmpty) {
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
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                            searchBloc.add(
                              PeopleFilterSelected(
                                filter: peopleFilters[index],
                              ),
                            );
                            searchBloc.add(
                              UserSearched(
                                query: searchController.text,
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
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
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
  }
}
