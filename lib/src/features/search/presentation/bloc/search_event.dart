part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class UserSearched extends SearchEvent {
  const UserSearched({
    required this.query,
  });

  final String query;

  @override
  List<Object> get props => [query];
}

class SearchTypeSelected extends SearchEvent {
  const SearchTypeSelected({
    required this.searchType,
    required this.query,
  });

  final SearchType searchType;
  final String query;

  @override
  List<Object> get props => [searchType, query];
}

class PeopleFilterSelected extends SearchEvent {
  const PeopleFilterSelected({
    required this.filter,
  });

  final String filter;

  @override
  List<Object> get props => [filter];
}

class SearchHistoryFetched extends SearchEvent {}

class SearchHistoryCleared extends SearchEvent {}

class PostSearched extends SearchEvent {
  const PostSearched({
    required this.query,
  });

  final String query;

  @override
  List<Object> get props => [query];
}
