import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/search/domain/domain.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required SearchUseCase searchUseCase})
      : _searchUseCase = searchUseCase,
        super(SearchState.initial()) {
    on<UserSearched>(
      _onUserSearched,
      transformer: debounce(_duration),
    );
    on<SearchFilterSelected>(_onSearchFilterSelected);
    on<PeopleFilterSelected>(_onPeopleFilterSelected);
    on<SearchHistoryFetched>(_onSearchHistoryFetched);
    on<SearchHistoryCleared>(_onSearchHistoryCleared);
  }

  final SearchUseCase _searchUseCase;

  Future<void> _onUserSearched(
    UserSearched event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(
        state.copyWith(
          isSearching: false,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: SearchStatus.loading,
        isSearching: true,
      ),
    );

    final result = await _searchUseCase.searchUsers(
      query: event.query.toLowerCase().replaceAll(' ', ''),
      filter: state.selectedPeopleFilter,
      limit: event.limit,
      offset: event.offset,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SearchStatus.failure,
          failure: failure,
        ),
      ),
      (users) => emit(
        state.copyWith(
          status: SearchStatus.success,
          searchUsers: users,
        ),
      ),
    );
  }

  void _onSearchFilterSelected(
    SearchFilterSelected event,
    Emitter<SearchState> emit,
  ) {
    emit(
      state.copyWith(
        selectedFilter: event.filter,
      ),
    );
  }

  void _onPeopleFilterSelected(
    PeopleFilterSelected event,
    Emitter<SearchState> emit,
  ) {
    emit(
      state.copyWith(
        selectedPeopleFilter: event.filter,
      ),
    );
  }

  void _onSearchHistoryFetched(
    SearchHistoryFetched event,
    Emitter<SearchState> emit,
  ) {
    final searchUsersHistories = SharedPrefs.getUserSearchHistories();
    final searchQueryHistories = SharedPrefs.getSearchQueryHistories();

    emit(
      state.copyWith(
        searchUsersHistories: searchUsersHistories,
        searchQueryHistories: searchQueryHistories,
      ),
    );
  }

  Future<void> _onSearchHistoryCleared(
    SearchHistoryCleared event,
    Emitter<SearchState> emit,
  ) async {
    await SharedPrefs.clearUserSearchHistoty();

    emit(
      state.copyWith(
        searchUsersHistories: [],
        searchQueryHistories: [],
      ),
    );
  }
}
