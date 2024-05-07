part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class UserSearched extends SearchEvent {
  const UserSearched({
    required this.query,
    required this.limit,
    required this.offset,
  });

  final String query;
  final int limit;
  final int offset;

  @override
  List<Object> get props => [query, limit, offset];
}

class SearchFilterSelected extends SearchEvent {
  const SearchFilterSelected({
    required this.filter,
  });

  final String filter;

  @override
  List<Object> get props => [filter];
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
