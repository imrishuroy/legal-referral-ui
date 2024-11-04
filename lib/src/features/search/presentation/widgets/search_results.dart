import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    required this.searchBloc,
    required this.searchController,
    super.key,
  });

  final SearchBloc searchBloc;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final state = searchBloc.state;

    // Display shimmer based on search type and loading status
    if (state.status == SearchStatus.loading) {
      switch (state.selectedSearchType) {
        case SearchType.people:
          return const SearchPeopleShimmer();
        case SearchType.posts:
          return const SearchPostShimmer();
        default:
          break;
      }
    }

    // Show recent searches if not actively searching
    if (!state.isSearching) {
      return RecentSearchWidget(searchBloc: searchBloc);
    }

    // Show search results based on selected search type
    return state.selectedSearchType == SearchType.posts
        ? PostSearchResults(
            searchBloc: searchBloc,
            searchController: searchController,
          )
        : PeopleSearchResults(
            searchBloc: searchBloc,
            searchController: searchController,
          );
  }
}
