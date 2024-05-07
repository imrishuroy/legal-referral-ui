part of 'search_bloc.dart';

const List<String> searchFilters = [
  'People',
  'Posts',
  'News',
];

const List<String> peopleFilters = [
  'All',
  '1st',
  '2nd',
];

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  const SearchState({
    required this.status,
    required this.searchUsers,
    this.isSearching = false,
    this.selectedFilter = 'People',
    this.selectedPeopleFilter = 'All',
    this.searchUsersHistories = const [],
    this.searchQueryHistories = const [],
    this.failure,
  });

  factory SearchState.initial() {
    return const SearchState(
      status: SearchStatus.initial,
      searchUsers: <AppUser>[],
    );
  }

  final SearchStatus status;
  final List<AppUser?> searchUsers;
  final bool isSearching;
  final String selectedFilter;
  final String selectedPeopleFilter;
  final List<AppUser?> searchUsersHistories;
  final List<String> searchQueryHistories;
  final Failure? failure;

  SearchState copyWith({
    SearchStatus? status,
    List<AppUser?>? searchUsers,
    bool? isSearching,
    String? selectedFilter,
    String? selectedPeopleFilter,
    List<AppUser?>? searchUsersHistories,
    List<String>? searchQueryHistories,
    Failure? failure,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchUsers: searchUsers ?? this.searchUsers,
      isSearching: isSearching ?? this.isSearching,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      selectedPeopleFilter: selectedPeopleFilter ?? this.selectedPeopleFilter,
      searchUsersHistories: searchUsersHistories ?? this.searchUsersHistories,
      searchQueryHistories: searchQueryHistories ?? this.searchQueryHistories,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        searchUsers,
        isSearching,
        selectedFilter,
        selectedPeopleFilter,
        searchUsersHistories,
        searchQueryHistories,
        failure,
      ];
}
