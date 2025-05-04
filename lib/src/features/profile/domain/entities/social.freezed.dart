// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Social {
  @JsonKey(name: 'entity_type')
  EntityType get entityType;
  @JsonKey(name: 'platform')
  SocialPlatform get platform;
  @JsonKey(name: 'link')
  String get link;
  @JsonKey(name: 'social_id', includeToJson: false)
  int? get socialId;
  @JsonKey(name: 'entity_id', includeToJson: false)
  String? get entityId;

  /// Create a copy of Social
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialCopyWith<Social> get copyWith =>
      _$SocialCopyWithImpl<Social>(this as Social, _$identity);

  /// Serializes this Social to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Social &&
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

  @override
  String toString() {
    return 'Social(entityType: $entityType, platform: $platform, link: $link, socialId: $socialId, entityId: $entityId)';
  }
}

/// @nodoc
abstract mixin class $SocialCopyWith<$Res> {
  factory $SocialCopyWith(Social value, $Res Function(Social) _then) =
      _$SocialCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'entity_type') EntityType entityType,
      @JsonKey(name: 'platform') SocialPlatform platform,
      @JsonKey(name: 'link') String link,
      @JsonKey(name: 'social_id', includeToJson: false) int? socialId,
      @JsonKey(name: 'entity_id', includeToJson: false) String? entityId});
}

/// @nodoc
class _$SocialCopyWithImpl<$Res> implements $SocialCopyWith<$Res> {
  _$SocialCopyWithImpl(this._self, this._then);

  final Social _self;
  final $Res Function(Social) _then;

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
    return _then(_self.copyWith(
      entityType: null == entityType
          ? _self.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as EntityType,
      platform: null == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as SocialPlatform,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      socialId: freezed == socialId
          ? _self.socialId
          : socialId // ignore: cast_nullable_to_non_nullable
              as int?,
      entityId: freezed == entityId
          ? _self.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Social implements Social {
  const _Social(
      {@JsonKey(name: 'entity_type') required this.entityType,
      @JsonKey(name: 'platform') required this.platform,
      @JsonKey(name: 'link') required this.link,
      @JsonKey(name: 'social_id', includeToJson: false) this.socialId,
      @JsonKey(name: 'entity_id', includeToJson: false) this.entityId});
  factory _Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);

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

  /// Create a copy of Social
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialCopyWith<_Social> get copyWith =>
      __$SocialCopyWithImpl<_Social>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SocialToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Social &&
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

  @override
  String toString() {
    return 'Social(entityType: $entityType, platform: $platform, link: $link, socialId: $socialId, entityId: $entityId)';
  }
}

/// @nodoc
abstract mixin class _$SocialCopyWith<$Res> implements $SocialCopyWith<$Res> {
  factory _$SocialCopyWith(_Social value, $Res Function(_Social) _then) =
      __$SocialCopyWithImpl;
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
class __$SocialCopyWithImpl<$Res> implements _$SocialCopyWith<$Res> {
  __$SocialCopyWithImpl(this._self, this._then);

  final _Social _self;
  final $Res Function(_Social) _then;

  /// Create a copy of Social
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entityType = null,
    Object? platform = null,
    Object? link = null,
    Object? socialId = freezed,
    Object? entityId = freezed,
  }) {
    return _then(_Social(
      entityType: null == entityType
          ? _self.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as EntityType,
      platform: null == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as SocialPlatform,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      socialId: freezed == socialId
          ? _self.socialId
          : socialId // ignore: cast_nullable_to_non_nullable
              as int?,
      entityId: freezed == entityId
          ? _self.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
