// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ad {
  @JsonKey(name: 'ad_type')
  AdType get type;
  String get title;
  String get description;
  String get link;
  @JsonKey(name: 'payment_cycle')
  PaymentCycle get paymentCycle;
  @JsonKey(name: 'author_id')
  String get authorId;
  @DateTimeJsonConverter()
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @DateTimeJsonConverter()
  @JsonKey(name: 'end_date')
  DateTime get endDate;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'ad_id', includeIfNull: false)
  int? get adId;
  @JsonKey(name: 'media')
  List<String?> get mediaUrls;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdCopyWith<Ad> get copyWith => _$AdCopyWithImpl<Ad>(this as Ad, _$identity);

  /// Serializes this Ad to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Ad &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.paymentCycle, paymentCycle) ||
                other.paymentCycle == paymentCycle) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.adId, adId) || other.adId == adId) &&
            const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      title,
      description,
      link,
      paymentCycle,
      authorId,
      startDate,
      endDate,
      createdAt,
      adId,
      const DeepCollectionEquality().hash(mediaUrls));

  @override
  String toString() {
    return 'Ad(type: $type, title: $title, description: $description, link: $link, paymentCycle: $paymentCycle, authorId: $authorId, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, adId: $adId, mediaUrls: $mediaUrls)';
  }
}

/// @nodoc
abstract mixin class $AdCopyWith<$Res> {
  factory $AdCopyWith(Ad value, $Res Function(Ad) _then) = _$AdCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'ad_type') AdType type,
      String title,
      String description,
      String link,
      @JsonKey(name: 'payment_cycle') PaymentCycle paymentCycle,
      @JsonKey(name: 'author_id') String authorId,
      @DateTimeJsonConverter() @JsonKey(name: 'start_date') DateTime startDate,
      @DateTimeJsonConverter() @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'ad_id', includeIfNull: false) int? adId,
      @JsonKey(name: 'media') List<String?> mediaUrls});
}

/// @nodoc
class _$AdCopyWithImpl<$Res> implements $AdCopyWith<$Res> {
  _$AdCopyWithImpl(this._self, this._then);

  final Ad _self;
  final $Res Function(Ad) _then;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? link = null,
    Object? paymentCycle = null,
    Object? authorId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
    Object? adId = freezed,
    Object? mediaUrls = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AdType,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCycle: null == paymentCycle
          ? _self.paymentCycle
          : paymentCycle // ignore: cast_nullable_to_non_nullable
              as PaymentCycle,
      authorId: null == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adId: freezed == adId
          ? _self.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaUrls: null == mediaUrls
          ? _self.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Ad implements Ad {
  const _Ad(
      {@JsonKey(name: 'ad_type') required this.type,
      required this.title,
      required this.description,
      required this.link,
      @JsonKey(name: 'payment_cycle') required this.paymentCycle,
      @JsonKey(name: 'author_id') required this.authorId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'start_date')
      required this.startDate,
      @DateTimeJsonConverter() @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'ad_id', includeIfNull: false) this.adId,
      @JsonKey(name: 'media') final List<String?> mediaUrls = const []})
      : _mediaUrls = mediaUrls;
  factory _Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

  @override
  @JsonKey(name: 'ad_type')
  final AdType type;
  @override
  final String title;
  @override
  final String description;
  @override
  final String link;
  @override
  @JsonKey(name: 'payment_cycle')
  final PaymentCycle paymentCycle;
  @override
  @JsonKey(name: 'author_id')
  final String authorId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'ad_id', includeIfNull: false)
  final int? adId;
  final List<String?> _mediaUrls;
  @override
  @JsonKey(name: 'media')
  List<String?> get mediaUrls {
    if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaUrls);
  }

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdCopyWith<_Ad> get copyWith => __$AdCopyWithImpl<_Ad>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ad &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.paymentCycle, paymentCycle) ||
                other.paymentCycle == paymentCycle) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.adId, adId) || other.adId == adId) &&
            const DeepCollectionEquality()
                .equals(other._mediaUrls, _mediaUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      title,
      description,
      link,
      paymentCycle,
      authorId,
      startDate,
      endDate,
      createdAt,
      adId,
      const DeepCollectionEquality().hash(_mediaUrls));

  @override
  String toString() {
    return 'Ad(type: $type, title: $title, description: $description, link: $link, paymentCycle: $paymentCycle, authorId: $authorId, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, adId: $adId, mediaUrls: $mediaUrls)';
  }
}

/// @nodoc
abstract mixin class _$AdCopyWith<$Res> implements $AdCopyWith<$Res> {
  factory _$AdCopyWith(_Ad value, $Res Function(_Ad) _then) = __$AdCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ad_type') AdType type,
      String title,
      String description,
      String link,
      @JsonKey(name: 'payment_cycle') PaymentCycle paymentCycle,
      @JsonKey(name: 'author_id') String authorId,
      @DateTimeJsonConverter() @JsonKey(name: 'start_date') DateTime startDate,
      @DateTimeJsonConverter() @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'ad_id', includeIfNull: false) int? adId,
      @JsonKey(name: 'media') List<String?> mediaUrls});
}

/// @nodoc
class __$AdCopyWithImpl<$Res> implements _$AdCopyWith<$Res> {
  __$AdCopyWithImpl(this._self, this._then);

  final _Ad _self;
  final $Res Function(_Ad) _then;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? link = null,
    Object? paymentCycle = null,
    Object? authorId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
    Object? adId = freezed,
    Object? mediaUrls = null,
  }) {
    return _then(_Ad(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AdType,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCycle: null == paymentCycle
          ? _self.paymentCycle
          : paymentCycle // ignore: cast_nullable_to_non_nullable
              as PaymentCycle,
      authorId: null == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adId: freezed == adId
          ? _self.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaUrls: null == mediaUrls
          ? _self._mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

// dart format on
