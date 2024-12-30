// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return _Feed.fromJson(json);
}

/// @nodoc
mixin _$Feed {
  @JsonKey(name: 'feed_id')
  int get feedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'feed_type')
  FeedType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'feed_post')
  Post? get post => throw _privateConstructorUsedError;
  @JsonKey(name: 'ad')
  Ad? get ad => throw _privateConstructorUsedError;

  /// Serializes this Feed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedCopyWith<Feed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res, Feed>;
  @useResult
  $Res call(
      {@JsonKey(name: 'feed_id') int feedId,
      @JsonKey(name: 'feed_type') FeedType type,
      @JsonKey(name: 'feed_post') Post? post,
      @JsonKey(name: 'ad') Ad? ad});

  $PostCopyWith<$Res>? get post;
  $AdCopyWith<$Res>? get ad;
}

/// @nodoc
class _$FeedCopyWithImpl<$Res, $Val extends Feed>
    implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedId = null,
    Object? type = null,
    Object? post = freezed,
    Object? ad = freezed,
  }) {
    return _then(_value.copyWith(
      feedId: null == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedType,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      ad: freezed == ad
          ? _value.ad
          : ad // ignore: cast_nullable_to_non_nullable
              as Ad?,
    ) as $Val);
  }

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res>? get post {
    if (_value.post == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_value.post!, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdCopyWith<$Res>? get ad {
    if (_value.ad == null) {
      return null;
    }

    return $AdCopyWith<$Res>(_value.ad!, (value) {
      return _then(_value.copyWith(ad: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedImplCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$$FeedImplCopyWith(
          _$FeedImpl value, $Res Function(_$FeedImpl) then) =
      __$$FeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'feed_id') int feedId,
      @JsonKey(name: 'feed_type') FeedType type,
      @JsonKey(name: 'feed_post') Post? post,
      @JsonKey(name: 'ad') Ad? ad});

  @override
  $PostCopyWith<$Res>? get post;
  @override
  $AdCopyWith<$Res>? get ad;
}

/// @nodoc
class __$$FeedImplCopyWithImpl<$Res>
    extends _$FeedCopyWithImpl<$Res, _$FeedImpl>
    implements _$$FeedImplCopyWith<$Res> {
  __$$FeedImplCopyWithImpl(_$FeedImpl _value, $Res Function(_$FeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedId = null,
    Object? type = null,
    Object? post = freezed,
    Object? ad = freezed,
  }) {
    return _then(_$FeedImpl(
      feedId: null == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedType,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      ad: freezed == ad
          ? _value.ad
          : ad // ignore: cast_nullable_to_non_nullable
              as Ad?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedImpl implements _Feed {
  const _$FeedImpl(
      {@JsonKey(name: 'feed_id') required this.feedId,
      @JsonKey(name: 'feed_type') required this.type,
      @JsonKey(name: 'feed_post') required this.post,
      @JsonKey(name: 'ad') this.ad});

  factory _$FeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedImplFromJson(json);

  @override
  @JsonKey(name: 'feed_id')
  final int feedId;
  @override
  @JsonKey(name: 'feed_type')
  final FeedType type;
  @override
  @JsonKey(name: 'feed_post')
  final Post? post;
  @override
  @JsonKey(name: 'ad')
  final Ad? ad;

  @override
  String toString() {
    return 'Feed(feedId: $feedId, type: $type, post: $post, ad: $ad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedImpl &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.ad, ad) || other.ad == ad));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, feedId, type, post, ad);

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      __$$FeedImplCopyWithImpl<_$FeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedImplToJson(
      this,
    );
  }
}

abstract class _Feed implements Feed {
  const factory _Feed(
      {@JsonKey(name: 'feed_id') required final int feedId,
      @JsonKey(name: 'feed_type') required final FeedType type,
      @JsonKey(name: 'feed_post') required final Post? post,
      @JsonKey(name: 'ad') final Ad? ad}) = _$FeedImpl;

  factory _Feed.fromJson(Map<String, dynamic> json) = _$FeedImpl.fromJson;

  @override
  @JsonKey(name: 'feed_id')
  int get feedId;
  @override
  @JsonKey(name: 'feed_type')
  FeedType get type;
  @override
  @JsonKey(name: 'feed_post')
  Post? get post;
  @override
  @JsonKey(name: 'ad')
  Ad? get ad;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
