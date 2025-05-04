// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessage {
  @JsonKey(name: 'sender_id')
  String get senderId;
  @JsonKey(name: 'recipient_id')
  String get recipientId;
  @JsonKey(name: 'message')
  String get message;
  @JsonKey(name: 'room_id')
  String get roomId;
  @JsonKey(name: 'parent_message_id')
  int? get parentMessageId;
  @JsonKey(name: 'has_attachment')
  bool get hasAttachment;
  @JsonKey(name: 'attachment_id', includeToJson: false)
  int? get attachmentId;
  @JsonKey(name: 'is_read', includeToJson: false)
  bool get isRead;
  @JsonKey(name: 'sent_at')
  @DateTimeJsonConverter()
  DateTime? get sentAt;
  @JsonKey(name: 'message_id', includeToJson: false)
  int? get messageId;
  @JsonKey(name: 'replied_message', includeToJson: false)
  ChatMessage? get repliedMessage;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessage &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.parentMessageId, parentMessageId) ||
                other.parentMessageId == parentMessageId) &&
            (identical(other.hasAttachment, hasAttachment) ||
                other.hasAttachment == hasAttachment) &&
            (identical(other.attachmentId, attachmentId) ||
                other.attachmentId == attachmentId) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.repliedMessage, repliedMessage) ||
                other.repliedMessage == repliedMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      senderId,
      recipientId,
      message,
      roomId,
      parentMessageId,
      hasAttachment,
      attachmentId,
      isRead,
      sentAt,
      messageId,
      repliedMessage);

  @override
  String toString() {
    return 'ChatMessage(senderId: $senderId, recipientId: $recipientId, message: $message, roomId: $roomId, parentMessageId: $parentMessageId, hasAttachment: $hasAttachment, attachmentId: $attachmentId, isRead: $isRead, sentAt: $sentAt, messageId: $messageId, repliedMessage: $repliedMessage)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) _then) =
      _$ChatMessageCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      @JsonKey(name: 'recipient_id') String recipientId,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'room_id') String roomId,
      @JsonKey(name: 'parent_message_id') int? parentMessageId,
      @JsonKey(name: 'has_attachment') bool hasAttachment,
      @JsonKey(name: 'attachment_id', includeToJson: false) int? attachmentId,
      @JsonKey(name: 'is_read', includeToJson: false) bool isRead,
      @JsonKey(name: 'sent_at') @DateTimeJsonConverter() DateTime? sentAt,
      @JsonKey(name: 'message_id', includeToJson: false) int? messageId,
      @JsonKey(name: 'replied_message', includeToJson: false)
      ChatMessage? repliedMessage});

  $ChatMessageCopyWith<$Res>? get repliedMessage;
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res> implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? recipientId = null,
    Object? message = null,
    Object? roomId = null,
    Object? parentMessageId = freezed,
    Object? hasAttachment = null,
    Object? attachmentId = freezed,
    Object? isRead = null,
    Object? sentAt = freezed,
    Object? messageId = freezed,
    Object? repliedMessage = freezed,
  }) {
    return _then(_self.copyWith(
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _self.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      parentMessageId: freezed == parentMessageId
          ? _self.parentMessageId
          : parentMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasAttachment: null == hasAttachment
          ? _self.hasAttachment
          : hasAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      attachmentId: freezed == attachmentId
          ? _self.attachmentId
          : attachmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      messageId: freezed == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      repliedMessage: freezed == repliedMessage
          ? _self.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage?,
    ));
  }

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageCopyWith<$Res>? get repliedMessage {
    if (_self.repliedMessage == null) {
      return null;
    }

    return $ChatMessageCopyWith<$Res>(_self.repliedMessage!, (value) {
      return _then(_self.copyWith(repliedMessage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ChatMessage implements ChatMessage {
  const _ChatMessage(
      {@JsonKey(name: 'sender_id') required this.senderId,
      @JsonKey(name: 'recipient_id') required this.recipientId,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'room_id') required this.roomId,
      @JsonKey(name: 'parent_message_id') this.parentMessageId,
      @JsonKey(name: 'has_attachment') this.hasAttachment = false,
      @JsonKey(name: 'attachment_id', includeToJson: false) this.attachmentId,
      @JsonKey(name: 'is_read', includeToJson: false) this.isRead = false,
      @JsonKey(name: 'sent_at') @DateTimeJsonConverter() this.sentAt,
      @JsonKey(name: 'message_id', includeToJson: false) this.messageId,
      @JsonKey(name: 'replied_message', includeToJson: false)
      this.repliedMessage});
  factory _ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  @override
  @JsonKey(name: 'sender_id')
  final String senderId;
  @override
  @JsonKey(name: 'recipient_id')
  final String recipientId;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'room_id')
  final String roomId;
  @override
  @JsonKey(name: 'parent_message_id')
  final int? parentMessageId;
  @override
  @JsonKey(name: 'has_attachment')
  final bool hasAttachment;
  @override
  @JsonKey(name: 'attachment_id', includeToJson: false)
  final int? attachmentId;
  @override
  @JsonKey(name: 'is_read', includeToJson: false)
  final bool isRead;
  @override
  @JsonKey(name: 'sent_at')
  @DateTimeJsonConverter()
  final DateTime? sentAt;
  @override
  @JsonKey(name: 'message_id', includeToJson: false)
  final int? messageId;
  @override
  @JsonKey(name: 'replied_message', includeToJson: false)
  final ChatMessage? repliedMessage;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageCopyWith<_ChatMessage> get copyWith =>
      __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessage &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.parentMessageId, parentMessageId) ||
                other.parentMessageId == parentMessageId) &&
            (identical(other.hasAttachment, hasAttachment) ||
                other.hasAttachment == hasAttachment) &&
            (identical(other.attachmentId, attachmentId) ||
                other.attachmentId == attachmentId) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.repliedMessage, repliedMessage) ||
                other.repliedMessage == repliedMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      senderId,
      recipientId,
      message,
      roomId,
      parentMessageId,
      hasAttachment,
      attachmentId,
      isRead,
      sentAt,
      messageId,
      repliedMessage);

  @override
  String toString() {
    return 'ChatMessage(senderId: $senderId, recipientId: $recipientId, message: $message, roomId: $roomId, parentMessageId: $parentMessageId, hasAttachment: $hasAttachment, attachmentId: $attachmentId, isRead: $isRead, sentAt: $sentAt, messageId: $messageId, repliedMessage: $repliedMessage)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(
          _ChatMessage value, $Res Function(_ChatMessage) _then) =
      __$ChatMessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      @JsonKey(name: 'recipient_id') String recipientId,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'room_id') String roomId,
      @JsonKey(name: 'parent_message_id') int? parentMessageId,
      @JsonKey(name: 'has_attachment') bool hasAttachment,
      @JsonKey(name: 'attachment_id', includeToJson: false) int? attachmentId,
      @JsonKey(name: 'is_read', includeToJson: false) bool isRead,
      @JsonKey(name: 'sent_at') @DateTimeJsonConverter() DateTime? sentAt,
      @JsonKey(name: 'message_id', includeToJson: false) int? messageId,
      @JsonKey(name: 'replied_message', includeToJson: false)
      ChatMessage? repliedMessage});

  @override
  $ChatMessageCopyWith<$Res>? get repliedMessage;
}

/// @nodoc
class __$ChatMessageCopyWithImpl<$Res> implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? senderId = null,
    Object? recipientId = null,
    Object? message = null,
    Object? roomId = null,
    Object? parentMessageId = freezed,
    Object? hasAttachment = null,
    Object? attachmentId = freezed,
    Object? isRead = null,
    Object? sentAt = freezed,
    Object? messageId = freezed,
    Object? repliedMessage = freezed,
  }) {
    return _then(_ChatMessage(
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _self.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      parentMessageId: freezed == parentMessageId
          ? _self.parentMessageId
          : parentMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasAttachment: null == hasAttachment
          ? _self.hasAttachment
          : hasAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      attachmentId: freezed == attachmentId
          ? _self.attachmentId
          : attachmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      messageId: freezed == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      repliedMessage: freezed == repliedMessage
          ? _self.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage?,
    ));
  }

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageCopyWith<$Res>? get repliedMessage {
    if (_self.repliedMessage == null) {
      return null;
    }

    return $ChatMessageCopyWith<$Res>(_self.repliedMessage!, (value) {
      return _then(_self.copyWith(repliedMessage: value));
    });
  }
}

// dart format on
