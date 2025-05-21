// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Feed {
  @JsonKey(name: 'feed_id')
  int get feedId;
  @JsonKey(name: 'feed_type')
  FeedType get type;
  @JsonKey(name: 'feed_post')
  Post? get post;
  @JsonKey(name: 'ad')
  Ad? get ad;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedCopyWith<Feed> get copyWith =>
      _$FeedCopyWithImpl<Feed>(this as Feed, _$identity);

  /// Serializes this Feed to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Feed &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.ad, ad) || other.ad == ad));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, feedId, type, post, ad);

  @override
  String toString() {
    return 'Feed(feedId: $feedId, type: $type, post: $post, ad: $ad)';
  }
}

/// @nodoc
abstract mixin class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) _then) =
      _$FeedCopyWithImpl;
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
class _$FeedCopyWithImpl<$Res> implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._self, this._then);

  final Feed _self;
  final $Res Function(Feed) _then;

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
    return _then(_self.copyWith(
      feedId: null == feedId
          ? _self.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedType,
      post: freezed == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      ad: freezed == ad
          ? _self.ad
          : ad // ignore: cast_nullable_to_non_nullable
              as Ad?,
    ));
  }

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res>? get post {
    if (_self.post == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_self.post!, (value) {
      return _then(_self.copyWith(post: value));
    });
  }

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdCopyWith<$Res>? get ad {
    if (_self.ad == null) {
      return null;
    }

    return $AdCopyWith<$Res>(_self.ad!, (value) {
      return _then(_self.copyWith(ad: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Feed implements Feed {
  const _Feed(
      {@JsonKey(name: 'feed_id') required this.feedId,
      @JsonKey(name: 'feed_type') required this.type,
      @JsonKey(name: 'feed_post') required this.post,
      @JsonKey(name: 'ad') this.ad});
  factory _Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

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

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeedCopyWith<_Feed> get copyWith =>
      __$FeedCopyWithImpl<_Feed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Feed &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.ad, ad) || other.ad == ad));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, feedId, type, post, ad);

  @override
  String toString() {
    return 'Feed(feedId: $feedId, type: $type, post: $post, ad: $ad)';
  }
}

/// @nodoc
abstract mixin class _$FeedCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$FeedCopyWith(_Feed value, $Res Function(_Feed) _then) =
      __$FeedCopyWithImpl;
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
class __$FeedCopyWithImpl<$Res> implements _$FeedCopyWith<$Res> {
  __$FeedCopyWithImpl(this._self, this._then);

  final _Feed _self;
  final $Res Function(_Feed) _then;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? feedId = null,
    Object? type = null,
    Object? post = freezed,
    Object? ad = freezed,
  }) {
    return _then(_Feed(
      feedId: null == feedId
          ? _self.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedType,
      post: freezed == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      ad: freezed == ad
          ? _self.ad
          : ad // ignore: cast_nullable_to_non_nullable
              as Ad?,
    ));
  }

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res>? get post {
    if (_self.post == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_self.post!, (value) {
      return _then(_self.copyWith(post: value));
    });
  }

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdCopyWith<$Res>? get ad {
    if (_self.ad == null) {
      return null;
    }

    return $AdCopyWith<$Res>(_self.ad!, (value) {
      return _then(_self.copyWith(ad: value));
    });
  }
}

// dart format on
