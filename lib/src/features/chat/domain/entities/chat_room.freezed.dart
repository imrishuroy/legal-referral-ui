// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return _ChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatRoom {
  @JsonKey(name: 'room_id')
  String get roomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name', includeToJson: false)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name', includeToJson: false)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url', includeToJson: false)
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message', includeToJson: false)
  String? get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message_sent_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get lastMessageAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_messages', defaultValue: 0, includeToJson: false)
  int? get unreadMessages => throw _privateConstructorUsedError;

  /// Serializes this ChatRoom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) then) =
      _$ChatRoomCopyWithImpl<$Res, ChatRoom>;
  @useResult
  $Res call(
      {@JsonKey(name: 'room_id') String roomId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'first_name', includeToJson: false) String? firstName,
      @JsonKey(name: 'last_name', includeToJson: false) String? lastName,
      @JsonKey(name: 'avatar_url', includeToJson: false) String? avatarUrl,
      @JsonKey(name: 'last_message', includeToJson: false) String? lastMessage,
      @JsonKey(name: 'last_message_sent_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? lastMessageAt,
      @JsonKey(name: 'unread_messages', defaultValue: 0, includeToJson: false)
      int? unreadMessages});
}

/// @nodoc
class _$ChatRoomCopyWithImpl<$Res, $Val extends ChatRoom>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatarUrl = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? unreadMessages = freezed,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _value.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadMessages: freezed == unreadMessages
          ? _value.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomImplCopyWith<$Res>
    implements $ChatRoomCopyWith<$Res> {
  factory _$$ChatRoomImplCopyWith(
          _$ChatRoomImpl value, $Res Function(_$ChatRoomImpl) then) =
      __$$ChatRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'room_id') String roomId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'first_name', includeToJson: false) String? firstName,
      @JsonKey(name: 'last_name', includeToJson: false) String? lastName,
      @JsonKey(name: 'avatar_url', includeToJson: false) String? avatarUrl,
      @JsonKey(name: 'last_message', includeToJson: false) String? lastMessage,
      @JsonKey(name: 'last_message_sent_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? lastMessageAt,
      @JsonKey(name: 'unread_messages', defaultValue: 0, includeToJson: false)
      int? unreadMessages});
}

/// @nodoc
class __$$ChatRoomImplCopyWithImpl<$Res>
    extends _$ChatRoomCopyWithImpl<$Res, _$ChatRoomImpl>
    implements _$$ChatRoomImplCopyWith<$Res> {
  __$$ChatRoomImplCopyWithImpl(
      _$ChatRoomImpl _value, $Res Function(_$ChatRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatarUrl = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? unreadMessages = freezed,
  }) {
    return _then(_$ChatRoomImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _value.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadMessages: freezed == unreadMessages
          ? _value.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomImpl implements _ChatRoom {
  const _$ChatRoomImpl(
      {@JsonKey(name: 'room_id') required this.roomId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'first_name', includeToJson: false) this.firstName,
      @JsonKey(name: 'last_name', includeToJson: false) this.lastName,
      @JsonKey(name: 'avatar_url', includeToJson: false) this.avatarUrl,
      @JsonKey(name: 'last_message', includeToJson: false) this.lastMessage,
      @JsonKey(name: 'last_message_sent_at', includeToJson: false)
      @DateTimeJsonConverter()
      this.lastMessageAt,
      @JsonKey(name: 'unread_messages', defaultValue: 0, includeToJson: false)
      this.unreadMessages});

  factory _$ChatRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomImplFromJson(json);

  @override
  @JsonKey(name: 'room_id')
  final String roomId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'first_name', includeToJson: false)
  final String? firstName;
  @override
  @JsonKey(name: 'last_name', includeToJson: false)
  final String? lastName;
  @override
  @JsonKey(name: 'avatar_url', includeToJson: false)
  final String? avatarUrl;
  @override
  @JsonKey(name: 'last_message', includeToJson: false)
  final String? lastMessage;
  @override
  @JsonKey(name: 'last_message_sent_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime? lastMessageAt;
  @override
  @JsonKey(name: 'unread_messages', defaultValue: 0, includeToJson: false)
  final int? unreadMessages;

  @override
  String toString() {
    return 'ChatRoom(roomId: $roomId, userId: $userId, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, unreadMessages: $unreadMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.unreadMessages, unreadMessages) ||
                other.unreadMessages == unreadMessages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, userId, firstName,
      lastName, avatarUrl, lastMessage, lastMessageAt, unreadMessages);

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      __$$ChatRoomImplCopyWithImpl<_$ChatRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomImplToJson(
      this,
    );
  }
}

abstract class _ChatRoom implements ChatRoom {
  const factory _ChatRoom(
      {@JsonKey(name: 'room_id') required final String roomId,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'first_name', includeToJson: false)
      final String? firstName,
      @JsonKey(name: 'last_name', includeToJson: false) final String? lastName,
      @JsonKey(name: 'avatar_url', includeToJson: false)
      final String? avatarUrl,
      @JsonKey(name: 'last_message', includeToJson: false)
      final String? lastMessage,
      @JsonKey(name: 'last_message_sent_at', includeToJson: false)
      @DateTimeJsonConverter()
      final DateTime? lastMessageAt,
      @JsonKey(name: 'unread_messages', defaultValue: 0, includeToJson: false)
      final int? unreadMessages}) = _$ChatRoomImpl;

  factory _ChatRoom.fromJson(Map<String, dynamic> json) =
      _$ChatRoomImpl.fromJson;

  @override
  @JsonKey(name: 'room_id')
  String get roomId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'first_name', includeToJson: false)
  String? get firstName;
  @override
  @JsonKey(name: 'last_name', includeToJson: false)
  String? get lastName;
  @override
  @JsonKey(name: 'avatar_url', includeToJson: false)
  String? get avatarUrl;
  @override
  @JsonKey(name: 'last_message', includeToJson: false)
  String? get lastMessage;
  @override
  @JsonKey(name: 'last_message_sent_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get lastMessageAt;
  @override
  @JsonKey(name: 'unread_messages', defaultValue: 0, includeToJson: false)
  int? get unreadMessages;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
