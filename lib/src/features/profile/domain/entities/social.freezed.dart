// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Social _$SocialFromJson(Map<String, dynamic> json) {
  return _Social.fromJson(json);
}

/// @nodoc
mixin _$Social {
  @JsonKey(name: 'entity_type')
  EntityType get entityType => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform')
  SocialPlatform get platform => throw _privateConstructorUsedError;
  @JsonKey(name: 'link')
  String get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_id', includeToJson: false)
  int? get socialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id', includeToJson: false)
  String? get entityId => throw _privateConstructorUsedError;

  /// Serializes this Social to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Social
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialCopyWith<Social> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialCopyWith<$Res> {
  factory $SocialCopyWith(Social value, $Res Function(Social) then) =
      _$SocialCopyWithImpl<$Res, Social>;
  @useResult
  $Res call(
      {@JsonKey(name: 'entity_type') EntityType entityType,
      @JsonKey(name: 'platform') SocialPlatform platform,
      @JsonKey(name: 'link') String link,
      @JsonKey(name: 'social_id', includeToJson: false) int? socialId,
      @JsonKey(name: 'entity_id', includeToJson: false) String? entityId});
}

/// @nodoc
class _$SocialCopyWithImpl<$Res, $Val extends Social>
    implements $SocialCopyWith<$Res> {
  _$SocialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Social
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityType = null,
    Object? platform = null,
    Object? link = null,
    Object? socialId = freezed,
    Object? entityId = freezed,
  }) {
    return _then(_value.copyWith(
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as EntityType,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as SocialPlatform,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      socialId: freezed == socialId
          ? _value.socialId
          : socialId // ignore: cast_nullable_to_non_nullable
              as int?,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialImplCopyWith<$Res> implements $SocialCopyWith<$Res> {
  factory _$$SocialImplCopyWith(
          _$SocialImpl value, $Res Function(_$SocialImpl) then) =
      __$$SocialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'entity_type') EntityType entityType,
      @JsonKey(name: 'platform') SocialPlatform platform,
      @JsonKey(name: 'link') String link,
      @JsonKey(name: 'social_id', includeToJson: false) int? socialId,
      @JsonKey(name: 'entity_id', includeToJson: false) String? entityId});
}

/// @nodoc
class __$$SocialImplCopyWithImpl<$Res>
    extends _$SocialCopyWithImpl<$Res, _$SocialImpl>
    implements _$$SocialImplCopyWith<$Res> {
  __$$SocialImplCopyWithImpl(
      _$SocialImpl _value, $Res Function(_$SocialImpl) _then)
      : super(_value, _then);

  /// Create a copy of Social
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityType = null,
    Object? platform = null,
    Object? link = null,
    Object? socialId = freezed,
    Object? entityId = freezed,
  }) {
    return _then(_$SocialImpl(
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as EntityType,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as SocialPlatform,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      socialId: freezed == socialId
          ? _value.socialId
          : socialId // ignore: cast_nullable_to_non_nullable
              as int?,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialImpl implements _Social {
  const _$SocialImpl(
      {@JsonKey(name: 'entity_type') required this.entityType,
      @JsonKey(name: 'platform') required this.platform,
      @JsonKey(name: 'link') required this.link,
      @JsonKey(name: 'social_id', includeToJson: false) this.socialId,
      @JsonKey(name: 'entity_id', includeToJson: false) this.entityId});

  factory _$SocialImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialImplFromJson(json);

  @override
  @JsonKey(name: 'entity_type')
  final EntityType entityType;
  @override
  @JsonKey(name: 'platform')
  final SocialPlatform platform;
  @override
  @JsonKey(name: 'link')
  final String link;
  @override
  @JsonKey(name: 'social_id', includeToJson: false)
  final int? socialId;
  @override
  @JsonKey(name: 'entity_id', includeToJson: false)
  final String? entityId;

  @override
  String toString() {
    return 'Social(entityType: $entityType, platform: $platform, link: $link, socialId: $socialId, entityId: $entityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialImpl &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.socialId, socialId) ||
                other.socialId == socialId) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, entityType, platform, link, socialId, entityId);

  /// Create a copy of Social
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialImplCopyWith<_$SocialImpl> get copyWith =>
      __$$SocialImplCopyWithImpl<_$SocialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialImplToJson(
      this,
    );
  }
}

abstract class _Social implements Social {
  const factory _Social(
      {@JsonKey(name: 'entity_type') required final EntityType entityType,
      @JsonKey(name: 'platform') required final SocialPlatform platform,
      @JsonKey(name: 'link') required final String link,
      @JsonKey(name: 'social_id', includeToJson: false) final int? socialId,
      @JsonKey(name: 'entity_id', includeToJson: false)
      final String? entityId}) = _$SocialImpl;

  factory _Social.fromJson(Map<String, dynamic> json) = _$SocialImpl.fromJson;

  @override
  @JsonKey(name: 'entity_type')
  EntityType get entityType;
  @override
  @JsonKey(name: 'platform')
  SocialPlatform get platform;
  @override
  @JsonKey(name: 'link')
  String get link;
  @override
  @JsonKey(name: 'social_id', includeToJson: false)
  int? get socialId;
  @override
  @JsonKey(name: 'entity_id', includeToJson: false)
  String? get entityId;

  /// Create a copy of Social
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialImplCopyWith<_$SocialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
