// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  @JsonKey(name: 'notification_id')
  int get notificationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_id')
  int get targetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_type')
  TargetType get targetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification_type')
  NotificationType get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_id')
  String get senderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_first_name')
  String? get senderFirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_last_name')
  String get senderLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_avatar_url')
  String? get senderAvatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {@JsonKey(name: 'notification_id') int notificationId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'target_id') int targetId,
      @JsonKey(name: 'target_type') TargetType targetType,
      @JsonKey(name: 'notification_type') NotificationType type,
      String message,
      @JsonKey(name: 'is_read') bool isRead,
      @JsonKey(name: 'sender_id') String senderId,
      @JsonKey(name: 'sender_first_name') String? senderFirstName,
      @JsonKey(name: 'sender_last_name') String senderLastName,
      @JsonKey(name: 'sender_avatar_url') String? senderAvatarUrl,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      DateTime createdAt});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? userId = null,
    Object? targetId = null,
    Object? targetType = null,
    Object? type = null,
    Object? message = null,
    Object? isRead = null,
    Object? senderId = null,
    Object? senderFirstName = freezed,
    Object? senderLastName = null,
    Object? senderAvatarUrl = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as TargetType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderFirstName: freezed == senderFirstName
          ? _value.senderFirstName
          : senderFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLastName: null == senderLastName
          ? _value.senderLastName
          : senderLastName // ignore: cast_nullable_to_non_nullable
              as String,
      senderAvatarUrl: freezed == senderAvatarUrl
          ? _value.senderAvatarUrl
          : senderAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'notification_id') int notificationId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'target_id') int targetId,
      @JsonKey(name: 'target_type') TargetType targetType,
      @JsonKey(name: 'notification_type') NotificationType type,
      String message,
      @JsonKey(name: 'is_read') bool isRead,
      @JsonKey(name: 'sender_id') String senderId,
      @JsonKey(name: 'sender_first_name') String? senderFirstName,
      @JsonKey(name: 'sender_last_name') String senderLastName,
      @JsonKey(name: 'sender_avatar_url') String? senderAvatarUrl,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      DateTime createdAt});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? userId = null,
    Object? targetId = null,
    Object? targetType = null,
    Object? type = null,
    Object? message = null,
    Object? isRead = null,
    Object? senderId = null,
    Object? senderFirstName = freezed,
    Object? senderLastName = null,
    Object? senderAvatarUrl = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$NotificationImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as TargetType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderFirstName: freezed == senderFirstName
          ? _value.senderFirstName
          : senderFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLastName: null == senderLastName
          ? _value.senderLastName
          : senderLastName // ignore: cast_nullable_to_non_nullable
              as String,
      senderAvatarUrl: freezed == senderAvatarUrl
          ? _value.senderAvatarUrl
          : senderAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {@JsonKey(name: 'notification_id') required this.notificationId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'target_id') required this.targetId,
      @JsonKey(name: 'target_type') required this.targetType,
      @JsonKey(name: 'notification_type') required this.type,
      required this.message,
      @JsonKey(name: 'is_read') required this.isRead,
      @JsonKey(name: 'sender_id') required this.senderId,
      @JsonKey(name: 'sender_first_name') required this.senderFirstName,
      @JsonKey(name: 'sender_last_name') required this.senderLastName,
      @JsonKey(name: 'sender_avatar_url') required this.senderAvatarUrl,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required this.createdAt});

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  @JsonKey(name: 'notification_id')
  final int notificationId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'target_id')
  final int targetId;
  @override
  @JsonKey(name: 'target_type')
  final TargetType targetType;
  @override
  @JsonKey(name: 'notification_type')
  final NotificationType type;
  @override
  final String message;
  @override
  @JsonKey(name: 'is_read')
  final bool isRead;
  @override
  @JsonKey(name: 'sender_id')
  final String senderId;
  @override
  @JsonKey(name: 'sender_first_name')
  final String? senderFirstName;
  @override
  @JsonKey(name: 'sender_last_name')
  final String senderLastName;
  @override
  @JsonKey(name: 'sender_avatar_url')
  final String? senderAvatarUrl;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'Notification(notificationId: $notificationId, userId: $userId, targetId: $targetId, targetType: $targetType, type: $type, message: $message, isRead: $isRead, senderId: $senderId, senderFirstName: $senderFirstName, senderLastName: $senderLastName, senderAvatarUrl: $senderAvatarUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderFirstName, senderFirstName) ||
                other.senderFirstName == senderFirstName) &&
            (identical(other.senderLastName, senderLastName) ||
                other.senderLastName == senderLastName) &&
            (identical(other.senderAvatarUrl, senderAvatarUrl) ||
                other.senderAvatarUrl == senderAvatarUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationId,
      userId,
      targetId,
      targetType,
      type,
      message,
      isRead,
      senderId,
      senderFirstName,
      senderLastName,
      senderAvatarUrl,
      createdAt);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {@JsonKey(name: 'notification_id') required final int notificationId,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'target_id') required final int targetId,
      @JsonKey(name: 'target_type') required final TargetType targetType,
      @JsonKey(name: 'notification_type') required final NotificationType type,
      required final String message,
      @JsonKey(name: 'is_read') required final bool isRead,
      @JsonKey(name: 'sender_id') required final String senderId,
      @JsonKey(name: 'sender_first_name')
      required final String? senderFirstName,
      @JsonKey(name: 'sender_last_name') required final String senderLastName,
      @JsonKey(name: 'sender_avatar_url')
      required final String? senderAvatarUrl,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required final DateTime createdAt}) = _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  @JsonKey(name: 'notification_id')
  int get notificationId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'target_id')
  int get targetId;
  @override
  @JsonKey(name: 'target_type')
  TargetType get targetType;
  @override
  @JsonKey(name: 'notification_type')
  NotificationType get type;
  @override
  String get message;
  @override
  @JsonKey(name: 'is_read')
  bool get isRead;
  @override
  @JsonKey(name: 'sender_id')
  String get senderId;
  @override
  @JsonKey(name: 'sender_first_name')
  String? get senderFirstName;
  @override
  @JsonKey(name: 'sender_last_name')
  String get senderLastName;
  @override
  @JsonKey(name: 'sender_avatar_url')
  String? get senderAvatarUrl;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
