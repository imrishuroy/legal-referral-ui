// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PopularSearch {
  String get query => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  /// Create a copy of PopularSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopularSearchCopyWith<PopularSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularSearchCopyWith<$Res> {
  factory $PopularSearchCopyWith(
          PopularSearch value, $Res Function(PopularSearch) then) =
      _$PopularSearchCopyWithImpl<$Res, PopularSearch>;
  @useResult
  $Res call({String query, int count, String location});
}

/// @nodoc
class _$PopularSearchCopyWithImpl<$Res, $Val extends PopularSearch>
    implements $PopularSearchCopyWith<$Res> {
  _$PopularSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopularSearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? count = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularSearchImplCopyWith<$Res>
    implements $PopularSearchCopyWith<$Res> {
  factory _$$PopularSearchImplCopyWith(
          _$PopularSearchImpl value, $Res Function(_$PopularSearchImpl) then) =
      __$$PopularSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, int count, String location});
}

/// @nodoc
class __$$PopularSearchImplCopyWithImpl<$Res>
    extends _$PopularSearchCopyWithImpl<$Res, _$PopularSearchImpl>
    implements _$$PopularSearchImplCopyWith<$Res> {
  __$$PopularSearchImplCopyWithImpl(
      _$PopularSearchImpl _value, $Res Function(_$PopularSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopularSearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? count = null,
    Object? location = null,
  }) {
    return _then(_$PopularSearchImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PopularSearchImpl implements _PopularSearch {
  const _$PopularSearchImpl(
      {required this.query, required this.count, required this.location});

  @override
  final String query;
  @override
  final int count;
  @override
  final String location;

  @override
  String toString() {
    return 'PopularSearch(query: $query, count: $count, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularSearchImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, count, location);

  /// Create a copy of PopularSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularSearchImplCopyWith<_$PopularSearchImpl> get copyWith =>
      __$$PopularSearchImplCopyWithImpl<_$PopularSearchImpl>(this, _$identity);
}

abstract class _PopularSearch implements PopularSearch {
  const factory _PopularSearch(
      {required final String query,
      required final int count,
      required final String location}) = _$PopularSearchImpl;

  @override
  String get query;
  @override
  int get count;
  @override
  String get location;

  /// Create a copy of PopularSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopularSearchImplCopyWith<_$PopularSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
