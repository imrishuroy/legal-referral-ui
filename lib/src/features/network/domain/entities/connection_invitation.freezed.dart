// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConnectionInvitation _$ConnectionInvitationFromJson(Map<String, dynamic> json) {
  return _ConnectionInvitation.fromJson(json);
}

/// @nodoc
mixin _$ConnectionInvitation {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_id')
  String? get senderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'recipient_id')
  String? get recipientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'about')
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  ConnectionInvitationStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionInvitationCopyWith<ConnectionInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionInvitationCopyWith<$Res> {
  factory $ConnectionInvitationCopyWith(ConnectionInvitation value,
          $Res Function(ConnectionInvitation) then) =
      _$ConnectionInvitationCopyWithImpl<$Res, ConnectionInvitation>;
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
class _$ConnectionInvitationCopyWithImpl<$Res,
        $Val extends ConnectionInvitation>
    implements $ConnectionInvitationCopyWith<$Res> {
  _$ConnectionInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientId: freezed == recipientId
          ? _value.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectionInvitationImplCopyWith<$Res>
    implements $ConnectionInvitationCopyWith<$Res> {
  factory _$$ConnectionInvitationImplCopyWith(_$ConnectionInvitationImpl value,
          $Res Function(_$ConnectionInvitationImpl) then) =
      __$$ConnectionInvitationImplCopyWithImpl<$Res>;
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
class __$$ConnectionInvitationImplCopyWithImpl<$Res>
    extends _$ConnectionInvitationCopyWithImpl<$Res, _$ConnectionInvitationImpl>
    implements _$$ConnectionInvitationImplCopyWith<$Res> {
  __$$ConnectionInvitationImplCopyWithImpl(_$ConnectionInvitationImpl _value,
      $Res Function(_$ConnectionInvitationImpl) _then)
      : super(_value, _then);

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
    return _then(_$ConnectionInvitationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      recipientId: freezed == recipientId
          ? _value.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectionInvitationImpl implements _ConnectionInvitation {
  const _$ConnectionInvitationImpl(
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

  factory _$ConnectionInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectionInvitationImplFromJson(json);

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

  @override
  String toString() {
    return 'ConnectionInvitation(id: $id, senderId: $senderId, recipientId: $recipientId, firstName: $firstName, lastName: $lastName, about: $about, avatarUrl: $avatarUrl, createdAt: $createdAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionInvitationImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, recipientId,
      firstName, lastName, about, avatarUrl, createdAt, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionInvitationImplCopyWith<_$ConnectionInvitationImpl>
      get copyWith =>
          __$$ConnectionInvitationImplCopyWithImpl<_$ConnectionInvitationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectionInvitationImplToJson(
      this,
    );
  }
}

abstract class _ConnectionInvitation implements ConnectionInvitation {
  const factory _ConnectionInvitation(
          {required final int? id,
          @JsonKey(name: 'sender_id') required final String? senderId,
          @JsonKey(name: 'recipient_id') required final String? recipientId,
          @JsonKey(name: 'first_name') required final String? firstName,
          @JsonKey(name: 'last_name') required final String? lastName,
          @JsonKey(name: 'about') required final String? about,
          @JsonKey(name: 'avatar_url') required final String? avatarUrl,
          @DateTimeJsonConverter()
          @JsonKey(name: 'created_at', includeToJson: false)
          required final DateTime? createdAt,
          @JsonKey(name: 'status')
          required final ConnectionInvitationStatus? status}) =
      _$ConnectionInvitationImpl;

  factory _ConnectionInvitation.fromJson(Map<String, dynamic> json) =
      _$ConnectionInvitationImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'sender_id')
  String? get senderId;
  @override
  @JsonKey(name: 'recipient_id')
  String? get recipientId;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'about')
  String? get about;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'status')
  ConnectionInvitationStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionInvitationImplCopyWith<_$ConnectionInvitationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
