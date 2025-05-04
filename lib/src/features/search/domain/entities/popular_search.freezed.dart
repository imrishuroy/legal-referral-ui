// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PopularSearch {
  String get query;
  int get count;
  String get location;

  /// Create a copy of PopularSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PopularSearchCopyWith<PopularSearch> get copyWith =>
      _$PopularSearchCopyWithImpl<PopularSearch>(
          this as PopularSearch, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PopularSearch &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, count, location);

  @override
  String toString() {
    return 'PopularSearch(query: $query, count: $count, location: $location)';
  }
}

/// @nodoc
abstract mixin class $PopularSearchCopyWith<$Res> {
  factory $PopularSearchCopyWith(
          PopularSearch value, $Res Function(PopularSearch) _then) =
      _$PopularSearchCopyWithImpl;
  @useResult
  $Res call({String query, int count, String location});
}

/// @nodoc
class _$PopularSearchCopyWithImpl<$Res>
    implements $PopularSearchCopyWith<$Res> {
  _$PopularSearchCopyWithImpl(this._self, this._then);

  final PopularSearch _self;
  final $Res Function(PopularSearch) _then;

  /// Create a copy of PopularSearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? count = null,
    Object? location = null,
  }) {
    return _then(_self.copyWith(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _PopularSearch implements PopularSearch {
  const _PopularSearch(
      {required this.query, required this.count, required this.location});

  @override
  final String query;
  @override
  final int count;
  @override
  final String location;

  /// Create a copy of PopularSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PopularSearchCopyWith<_PopularSearch> get copyWith =>
      __$PopularSearchCopyWithImpl<_PopularSearch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PopularSearch &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, count, location);

  @override
  String toString() {
    return 'PopularSearch(query: $query, count: $count, location: $location)';
  }
}

/// @nodoc
abstract mixin class _$PopularSearchCopyWith<$Res>
    implements $PopularSearchCopyWith<$Res> {
  factory _$PopularSearchCopyWith(
          _PopularSearch value, $Res Function(_PopularSearch) _then) =
      __$PopularSearchCopyWithImpl;
  @override
  @useResult
  $Res call({String query, int count, String location});
}

/// @nodoc
class __$PopularSearchCopyWithImpl<$Res>
    implements _$PopularSearchCopyWith<$Res> {
  __$PopularSearchCopyWithImpl(this._self, this._then);

  final _PopularSearch _self;
  final $Res Function(_PopularSearch) _then;

  /// Create a copy of PopularSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? count = null,
    Object? location = null,
  }) {
    return _then(_PopularSearch(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
