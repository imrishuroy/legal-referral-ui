// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatRoom {
  @JsonKey(name: 'room_id')
  String get roomId;
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'first_name', includeToJson: false)
  String? get firstName;
  @JsonKey(name: 'last_name', includeToJson: false)
  String? get lastName;
  @JsonKey(name: 'avatar_url', includeToJson: false)
  String? get avatarUrl;
  @JsonKey(name: 'last_message', includeToJson: false)
  String? get lastMessage;
  @JsonKey(name: 'last_message_sent_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get lastMessageAt;
  @JsonKey(name: 'unread_messages', defaultValue: 0, includeToJson: false)
  int? get unreadMessages;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      _$ChatRoomCopyWithImpl<ChatRoom>(this as ChatRoom, _$identity);

  /// Serializes this ChatRoom to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatRoom &&
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

  @override
  String toString() {
    return 'ChatRoom(roomId: $roomId, userId: $userId, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, unreadMessages: $unreadMessages)';
  }
}

/// @nodoc
abstract mixin class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) _then) =
      _$ChatRoomCopyWithImpl;
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
class _$ChatRoomCopyWithImpl<$Res> implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._self, this._then);

  final ChatRoom _self;
  final $Res Function(ChatRoom) _then;

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
    return _then(_self.copyWith(
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _self.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadMessages: freezed == unreadMessages
          ? _self.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatRoom implements ChatRoom {
  const _ChatRoom(
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
  factory _ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

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

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatRoomCopyWith<_ChatRoom> get copyWith =>
      __$ChatRoomCopyWithImpl<_ChatRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatRoomToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatRoom &&
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

  @override
  String toString() {
    return 'ChatRoom(roomId: $roomId, userId: $userId, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, unreadMessages: $unreadMessages)';
  }
}

/// @nodoc
abstract mixin class _$ChatRoomCopyWith<$Res>
    implements $ChatRoomCopyWith<$Res> {
  factory _$ChatRoomCopyWith(_ChatRoom value, $Res Function(_ChatRoom) _then) =
      __$ChatRoomCopyWithImpl;
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
class __$ChatRoomCopyWithImpl<$Res> implements _$ChatRoomCopyWith<$Res> {
  __$ChatRoomCopyWithImpl(this._self, this._then);

  final _ChatRoom _self;
  final $Res Function(_ChatRoom) _then;

  /// Create a copy of ChatRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_ChatRoom(
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _self.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadMessages: freezed == unreadMessages
          ? _self.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
