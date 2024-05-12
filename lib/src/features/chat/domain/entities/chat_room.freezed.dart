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
  @JsonKey(name: 'user1_id')
  String get user1Id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user2_id')
  String get user2Id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user2_first_name', includeToJson: false)
  String? get user2FirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user2_last_name', includeToJson: false)
  String? get user2LastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user2_avatar_url', includeToJson: false)
  String? get user2AvatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message', includeToJson: false)
  String? get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message_sent_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get lastMessageAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'unread_messages', defaultValue: 0, includeToJson: false)
  int? get unreadMessages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @JsonKey(name: 'user1_id') String user1Id,
      @JsonKey(name: 'user2_id') String user2Id,
      @JsonKey(name: 'user2_first_name', includeToJson: false)
      String? user2FirstName,
      @JsonKey(name: 'user2_last_name', includeToJson: false)
      String? user2LastName,
      @JsonKey(name: 'user2_avatar_url', includeToJson: false)
      String? user2AvatarUrl,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? user1Id = null,
    Object? user2Id = null,
    Object? user2FirstName = freezed,
    Object? user2LastName = freezed,
    Object? user2AvatarUrl = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? unreadMessages = freezed,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      user1Id: null == user1Id
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as String,
      user2Id: null == user2Id
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as String,
      user2FirstName: freezed == user2FirstName
          ? _value.user2FirstName
          : user2FirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      user2LastName: freezed == user2LastName
          ? _value.user2LastName
          : user2LastName // ignore: cast_nullable_to_non_nullable
              as String?,
      user2AvatarUrl: freezed == user2AvatarUrl
          ? _value.user2AvatarUrl
          : user2AvatarUrl // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'user1_id') String user1Id,
      @JsonKey(name: 'user2_id') String user2Id,
      @JsonKey(name: 'user2_first_name', includeToJson: false)
      String? user2FirstName,
      @JsonKey(name: 'user2_last_name', includeToJson: false)
      String? user2LastName,
      @JsonKey(name: 'user2_avatar_url', includeToJson: false)
      String? user2AvatarUrl,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? user1Id = null,
    Object? user2Id = null,
    Object? user2FirstName = freezed,
    Object? user2LastName = freezed,
    Object? user2AvatarUrl = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageAt = freezed,
    Object? unreadMessages = freezed,
  }) {
    return _then(_$ChatRoomImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      user1Id: null == user1Id
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as String,
      user2Id: null == user2Id
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as String,
      user2FirstName: freezed == user2FirstName
          ? _value.user2FirstName
          : user2FirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      user2LastName: freezed == user2LastName
          ? _value.user2LastName
          : user2LastName // ignore: cast_nullable_to_non_nullable
              as String?,
      user2AvatarUrl: freezed == user2AvatarUrl
          ? _value.user2AvatarUrl
          : user2AvatarUrl // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'user1_id') required this.user1Id,
      @JsonKey(name: 'user2_id') required this.user2Id,
      @JsonKey(name: 'user2_first_name', includeToJson: false)
      this.user2FirstName,
      @JsonKey(name: 'user2_last_name', includeToJson: false)
      this.user2LastName,
      @JsonKey(name: 'user2_avatar_url', includeToJson: false)
      this.user2AvatarUrl,
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
  @JsonKey(name: 'user1_id')
  final String user1Id;
  @override
  @JsonKey(name: 'user2_id')
  final String user2Id;
  @override
  @JsonKey(name: 'user2_first_name', includeToJson: false)
  final String? user2FirstName;
  @override
  @JsonKey(name: 'user2_last_name', includeToJson: false)
  final String? user2LastName;
  @override
  @JsonKey(name: 'user2_avatar_url', includeToJson: false)
  final String? user2AvatarUrl;
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
    return 'ChatRoom(roomId: $roomId, user1Id: $user1Id, user2Id: $user2Id, user2FirstName: $user2FirstName, user2LastName: $user2LastName, user2AvatarUrl: $user2AvatarUrl, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, unreadMessages: $unreadMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.user1Id, user1Id) || other.user1Id == user1Id) &&
            (identical(other.user2Id, user2Id) || other.user2Id == user2Id) &&
            (identical(other.user2FirstName, user2FirstName) ||
                other.user2FirstName == user2FirstName) &&
            (identical(other.user2LastName, user2LastName) ||
                other.user2LastName == user2LastName) &&
            (identical(other.user2AvatarUrl, user2AvatarUrl) ||
                other.user2AvatarUrl == user2AvatarUrl) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.unreadMessages, unreadMessages) ||
                other.unreadMessages == unreadMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomId,
      user1Id,
      user2Id,
      user2FirstName,
      user2LastName,
      user2AvatarUrl,
      lastMessage,
      lastMessageAt,
      unreadMessages);

  @JsonKey(ignore: true)
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
      @JsonKey(name: 'user1_id') required final String user1Id,
      @JsonKey(name: 'user2_id') required final String user2Id,
      @JsonKey(name: 'user2_first_name', includeToJson: false)
      final String? user2FirstName,
      @JsonKey(name: 'user2_last_name', includeToJson: false)
      final String? user2LastName,
      @JsonKey(name: 'user2_avatar_url', includeToJson: false)
      final String? user2AvatarUrl,
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
  @JsonKey(name: 'user1_id')
  String get user1Id;
  @override
  @JsonKey(name: 'user2_id')
  String get user2Id;
  @override
  @JsonKey(name: 'user2_first_name', includeToJson: false)
  String? get user2FirstName;
  @override
  @JsonKey(name: 'user2_last_name', includeToJson: false)
  String? get user2LastName;
  @override
  @JsonKey(name: 'user2_avatar_url', includeToJson: false)
  String? get user2AvatarUrl;
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
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
