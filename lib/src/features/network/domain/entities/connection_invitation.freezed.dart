// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectionInvitation {
  int? get id;
  @JsonKey(name: 'sender_id')
  String? get senderId;
  @JsonKey(name: 'recipient_id')
  String? get recipientId;
  @JsonKey(name: 'first_name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  @JsonKey(name: 'about')
  String? get about;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime? get createdAt;
  @JsonKey(name: 'status')
  ConnectionInvitationStatus? get status;

  /// Create a copy of ConnectionInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConnectionInvitationCopyWith<ConnectionInvitation> get copyWith =>
      _$ConnectionInvitationCopyWithImpl<ConnectionInvitation>(
          this as ConnectionInvitation, _$identity);

  /// Serializes this ConnectionInvitation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectionInvitation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, recipientId,
      firstName, lastName, about, avatarUrl, createdAt, status);

  @override
  String toString() {
    return 'ConnectionInvitation(id: $id, senderId: $senderId, recipientId: $recipientId, firstName: $firstName, lastName: $lastName, about: $about, avatarUrl: $avatarUrl, createdAt: $createdAt, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ConnectionInvitationCopyWith<$Res> {
  factory $ConnectionInvitationCopyWith(ConnectionInvitation value,
          $Res Function(ConnectionInvitation) _then) =
      _$ConnectionInvitationCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'sender_id') String? senderId,
      @JsonKey(name: 'recipient_id') String? recipientId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'about') String? about,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: 'status') ConnectionInvitationStatus? status});
}

/// @nodoc
class _$ConnectionInvitationCopyWithImpl<$Res>
    implements $ConnectionInvitationCopyWith<$Res> {
  _$ConnectionInvitationCopyWithImpl(this._self, this._then);

  final ConnectionInvitation _self;
  final $Res Function(ConnectionInvitation) _then;

  /// Create a copy of ConnectionInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? senderId = freezed,
    Object? recipientId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? about = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      senderId: freezed == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientId: freezed == recipientId
          ? _self.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ConnectionInvitation implements ConnectionInvitation {
  const _ConnectionInvitation(
      {required this.id,
      @JsonKey(name: 'sender_id') required this.senderId,
      @JsonKey(name: 'recipient_id') required this.recipientId,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      @JsonKey(name: 'about') required this.about,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      required this.createdAt,
      @JsonKey(name: 'status') required this.status});
  factory _ConnectionInvitation.fromJson(Map<String, dynamic> json) =>
      _$ConnectionInvitationFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'sender_id')
  final String? senderId;
  @override
  @JsonKey(name: 'recipient_id')
  final String? recipientId;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'about')
  final String? about;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeToJson: false)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'status')
  final ConnectionInvitationStatus? status;

  /// Create a copy of ConnectionInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConnectionInvitationCopyWith<_ConnectionInvitation> get copyWith =>
      __$ConnectionInvitationCopyWithImpl<_ConnectionInvitation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConnectionInvitationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConnectionInvitation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, recipientId,
      firstName, lastName, about, avatarUrl, createdAt, status);

  @override
  String toString() {
    return 'ConnectionInvitation(id: $id, senderId: $senderId, recipientId: $recipientId, firstName: $firstName, lastName: $lastName, about: $about, avatarUrl: $avatarUrl, createdAt: $createdAt, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ConnectionInvitationCopyWith<$Res>
    implements $ConnectionInvitationCopyWith<$Res> {
  factory _$ConnectionInvitationCopyWith(_ConnectionInvitation value,
          $Res Function(_ConnectionInvitation) _then) =
      __$ConnectionInvitationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'sender_id') String? senderId,
      @JsonKey(name: 'recipient_id') String? recipientId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'about') String? about,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: 'status') ConnectionInvitationStatus? status});
}

/// @nodoc
class __$ConnectionInvitationCopyWithImpl<$Res>
    implements _$ConnectionInvitationCopyWith<$Res> {
  __$ConnectionInvitationCopyWithImpl(this._self, this._then);

  final _ConnectionInvitation _self;
  final $Res Function(_ConnectionInvitation) _then;

  /// Create a copy of ConnectionInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? senderId = freezed,
    Object? recipientId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? about = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
  }) {
    return _then(_ConnectionInvitation(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      senderId: freezed == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientId: freezed == recipientId
          ? _self.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus?,
    ));
  }
}

// dart format on
