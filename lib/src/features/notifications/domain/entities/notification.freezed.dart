// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Notification {
  @JsonKey(name: 'notification_id')
  int get notificationId;
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'target_id')
  int get targetId;
  @JsonKey(name: 'target_type')
  TargetType get targetType;
  @JsonKey(name: 'notification_type')
  NotificationType get type;
  String get message;
  @JsonKey(name: 'is_read')
  bool get isRead;
  @JsonKey(name: 'sender_id')
  String get senderId;
  @JsonKey(name: 'sender_first_name')
  String? get senderFirstName;
  @JsonKey(name: 'sender_last_name')
  String get senderLastName;
  @JsonKey(name: 'sender_avatar_url')
  String? get senderAvatarUrl;
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationCopyWith<Notification> get copyWith =>
      _$NotificationCopyWithImpl<Notification>(
          this as Notification, _$identity);

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Notification &&
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

  @override
  String toString() {
    return 'Notification(notificationId: $notificationId, userId: $userId, targetId: $targetId, targetType: $targetType, type: $type, message: $message, isRead: $isRead, senderId: $senderId, senderFirstName: $senderFirstName, senderLastName: $senderLastName, senderAvatarUrl: $senderAvatarUrl, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) _then) =
      _$NotificationCopyWithImpl;
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
class _$NotificationCopyWithImpl<$Res> implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._self, this._then);

  final Notification _self;
  final $Res Function(Notification) _then;

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
    return _then(_self.copyWith(
      notificationId: null == notificationId
          ? _self.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      targetType: null == targetType
          ? _self.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as TargetType,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderFirstName: freezed == senderFirstName
          ? _self.senderFirstName
          : senderFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLastName: null == senderLastName
          ? _self.senderLastName
          : senderLastName // ignore: cast_nullable_to_non_nullable
              as String,
      senderAvatarUrl: freezed == senderAvatarUrl
          ? _self.senderAvatarUrl
          : senderAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Notification implements Notification {
  const _Notification(
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
  factory _Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

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

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationCopyWith<_Notification> get copyWith =>
      __$NotificationCopyWithImpl<_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Notification &&
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

  @override
  String toString() {
    return 'Notification(notificationId: $notificationId, userId: $userId, targetId: $targetId, targetType: $targetType, type: $type, message: $message, isRead: $isRead, senderId: $senderId, senderFirstName: $senderFirstName, senderLastName: $senderLastName, senderAvatarUrl: $senderAvatarUrl, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(
          _Notification value, $Res Function(_Notification) _then) =
      __$NotificationCopyWithImpl;
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
class __$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(this._self, this._then);

  final _Notification _self;
  final $Res Function(_Notification) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Notification(
      notificationId: null == notificationId
          ? _self.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetId: null == targetId
          ? _self.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as int,
      targetType: null == targetType
          ? _self.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as TargetType,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderFirstName: freezed == senderFirstName
          ? _self.senderFirstName
          : senderFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLastName: null == senderLastName
          ? _self.senderLastName
          : senderLastName // ignore: cast_nullable_to_non_nullable
              as String,
      senderAvatarUrl: freezed == senderAvatarUrl
          ? _self.senderAvatarUrl
          : senderAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
