import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_search.freezed.dart';

@freezed
class PopularSearch with _$PopularSearch {
  const factory PopularSearch({
    required String query,
    required int count,
    required String location,
  }) = _PopularSearch;
}
