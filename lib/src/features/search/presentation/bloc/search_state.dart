part of 'search_bloc.dart';

enum SearchType { people, posts }

const List<String> peopleFilters = [
  'All',
  '1st',
  '2nd',
];

const _limit = 20;

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  const SearchState({
    required this.status,
    this.users = const [],
    this.posts = const [],
    this.offset = 1,
    this.hasReachedMax = false,
    this.isSearching = false,
    this.selectedSearchType = SearchType.people,
    this.selectedPeopleFilter = 'All',
    this.searchUsersHistories = const [],
    this.searchQueryHistories = const [],
    this.failure,
  });

  factory SearchState.initial() {
    return const SearchState(
      status: SearchStatus.initial,
    );
  }

  final SearchStatus status;
  final List<AppUser?> users;
  final List<Post?> posts;
  final int offset;
  final bool hasReachedMax;
  final bool isSearching;
  final SearchType selectedSearchType;
  final String selectedPeopleFilter;
  final List<AppUser?> searchUsersHistories;
  final List<String> searchQueryHistories;

  final Failure? failure;

  SearchState copyWith({
    SearchStatus? status,
    List<AppUser?>? users,
    List<Post?>? posts,
    int? offset,
    bool? hasReachedMax,
    bool? isSearching,
    SearchType? selectedSearchType,
    String? selectedPeopleFilter,
    List<AppUser?>? searchUsersHistories,
    List<String>? searchQueryHistories,
    Failure? failure,
  }) {
    return SearchState(
      status: status ?? this.status,
      offset: offset ?? this.offset,
      users: users ?? this.users,
      posts: posts ?? this.posts,
      isSearching: isSearching ?? this.isSearching,
      selectedSearchType: selectedSearchType ?? this.selectedSearchType,
      selectedPeopleFilter: selectedPeopleFilter ?? this.selectedPeopleFilter,
      searchUsersHistories: searchUsersHistories ?? this.searchUsersHistories,
      searchQueryHistories: searchQueryHistories ?? this.searchQueryHistories,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        offset,
        users,
        posts,
        isSearching,
        selectedSearchType,
        selectedPeopleFilter,
        searchUsersHistories,
        searchQueryHistories,
        failure,
      ];
}
