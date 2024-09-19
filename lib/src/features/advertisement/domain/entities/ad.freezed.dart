// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ad _$AdFromJson(Map<String, dynamic> json) {
  return _Ad.fromJson(json);
}

/// @nodoc
mixin _$Ad {
  @JsonKey(name: 'ad_type')
  AdType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_cycle')
  PaymentCycle get paymentCycle => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_id')
  String get authorId => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'end_date')
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ad_id', includeIfNull: false)
  int? get adId => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  List<String?> get mediaUrls => throw _privateConstructorUsedError;

  /// Serializes this Ad to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdCopyWith<Ad> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdCopyWith<$Res> {
  factory $AdCopyWith(Ad value, $Res Function(Ad) then) =
      _$AdCopyWithImpl<$Res, Ad>;
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
class _$AdCopyWithImpl<$Res, $Val extends Ad> implements $AdCopyWith<$Res> {
  _$AdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AdType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCycle: null == paymentCycle
          ? _value.paymentCycle
          : paymentCycle // ignore: cast_nullable_to_non_nullable
              as PaymentCycle,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adId: freezed == adId
          ? _value.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaUrls: null == mediaUrls
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdImplCopyWith<$Res> implements $AdCopyWith<$Res> {
  factory _$$AdImplCopyWith(_$AdImpl value, $Res Function(_$AdImpl) then) =
      __$$AdImplCopyWithImpl<$Res>;
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
class __$$AdImplCopyWithImpl<$Res> extends _$AdCopyWithImpl<$Res, _$AdImpl>
    implements _$$AdImplCopyWith<$Res> {
  __$$AdImplCopyWithImpl(_$AdImpl _value, $Res Function(_$AdImpl) _then)
      : super(_value, _then);

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
    return _then(_$AdImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AdType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCycle: null == paymentCycle
          ? _value.paymentCycle
          : paymentCycle // ignore: cast_nullable_to_non_nullable
              as PaymentCycle,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adId: freezed == adId
          ? _value.adId
          : adId // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaUrls: null == mediaUrls
          ? _value._mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdImpl implements _Ad {
  const _$AdImpl(
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

  factory _$AdImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdImplFromJson(json);

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

  @override
  String toString() {
    return 'Ad(type: $type, title: $title, description: $description, link: $link, paymentCycle: $paymentCycle, authorId: $authorId, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, adId: $adId, mediaUrls: $mediaUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdImpl &&
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

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdImplCopyWith<_$AdImpl> get copyWith =>
      __$$AdImplCopyWithImpl<_$AdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdImplToJson(
      this,
    );
  }
}

abstract class _Ad implements Ad {
  const factory _Ad(
      {@JsonKey(name: 'ad_type') required final AdType type,
      required final String title,
      required final String description,
      required final String link,
      @JsonKey(name: 'payment_cycle') required final PaymentCycle paymentCycle,
      @JsonKey(name: 'author_id') required final String authorId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'start_date')
      required final DateTime startDate,
      @DateTimeJsonConverter()
      @JsonKey(name: 'end_date')
      required final DateTime endDate,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'ad_id', includeIfNull: false) final int? adId,
      @JsonKey(name: 'media') final List<String?> mediaUrls}) = _$AdImpl;

  factory _Ad.fromJson(Map<String, dynamic> json) = _$AdImpl.fromJson;

  @override
  @JsonKey(name: 'ad_type')
  AdType get type;
  @override
  String get title;
  @override
  String get description;
  @override
  String get link;
  @override
  @JsonKey(name: 'payment_cycle')
  PaymentCycle get paymentCycle;
  @override
  @JsonKey(name: 'author_id')
  String get authorId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'end_date')
  DateTime get endDate;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'ad_id', includeIfNull: false)
  int? get adId;
  @override
  @JsonKey(name: 'media')
  List<String?> get mediaUrls;

  /// Create a copy of Ad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdImplCopyWith<_$AdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
