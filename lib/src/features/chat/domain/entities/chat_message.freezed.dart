// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  @JsonKey(name: 'sender_id')
  String get senderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'recipient_id')
  String get recipientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'room_id')
  String get roomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_message_id')
  int? get parentMessageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_attachment')
  bool get hasAttachment => throw _privateConstructorUsedError;
  @JsonKey(name: 'attachment_id', includeToJson: false)
  int? get attachmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read', includeToJson: false)
  bool get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'sent_at')
  @DateTimeJsonConverter()
  DateTime? get sentAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_id', includeToJson: false)
  int? get messageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'replied_message', includeToJson: false)
  ChatMessage? get repliedMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
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
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _value.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      parentMessageId: freezed == parentMessageId
          ? _value.parentMessageId
          : parentMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasAttachment: null == hasAttachment
          ? _value.hasAttachment
          : hasAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      attachmentId: freezed == attachmentId
          ? _value.attachmentId
          : attachmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      repliedMessage: freezed == repliedMessage
          ? _value.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatMessageCopyWith<$Res>? get repliedMessage {
    if (_value.repliedMessage == null) {
      return null;
    }

    return $ChatMessageCopyWith<$Res>(_value.repliedMessage!, (value) {
      return _then(_value.copyWith(repliedMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
          _$ChatMessageImpl value, $Res Function(_$ChatMessageImpl) then) =
      __$$ChatMessageImplCopyWithImpl<$Res>;
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
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
      _$ChatMessageImpl _value, $Res Function(_$ChatMessageImpl) _then)
      : super(_value, _then);

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
    return _then(_$ChatMessageImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _value.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      parentMessageId: freezed == parentMessageId
          ? _value.parentMessageId
          : parentMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasAttachment: null == hasAttachment
          ? _value.hasAttachment
          : hasAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      attachmentId: freezed == attachmentId
          ? _value.attachmentId
          : attachmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      repliedMessage: freezed == repliedMessage
          ? _value.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl(
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

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

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

  @override
  String toString() {
    return 'ChatMessage(senderId: $senderId, recipientId: $recipientId, message: $message, roomId: $roomId, parentMessageId: $parentMessageId, hasAttachment: $hasAttachment, attachmentId: $attachmentId, isRead: $isRead, sentAt: $sentAt, messageId: $messageId, repliedMessage: $repliedMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(
      this,
    );
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage(
      {@JsonKey(name: 'sender_id') required final String senderId,
      @JsonKey(name: 'recipient_id') required final String recipientId,
      @JsonKey(name: 'message') required final String message,
      @JsonKey(name: 'room_id') required final String roomId,
      @JsonKey(name: 'parent_message_id') final int? parentMessageId,
      @JsonKey(name: 'has_attachment') final bool hasAttachment,
      @JsonKey(name: 'attachment_id', includeToJson: false)
      final int? attachmentId,
      @JsonKey(name: 'is_read', includeToJson: false) final bool isRead,
      @JsonKey(name: 'sent_at') @DateTimeJsonConverter() final DateTime? sentAt,
      @JsonKey(name: 'message_id', includeToJson: false) final int? messageId,
      @JsonKey(name: 'replied_message', includeToJson: false)
      final ChatMessage? repliedMessage}) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  @JsonKey(name: 'sender_id')
  String get senderId;
  @override
  @JsonKey(name: 'recipient_id')
  String get recipientId;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'room_id')
  String get roomId;
  @override
  @JsonKey(name: 'parent_message_id')
  int? get parentMessageId;
  @override
  @JsonKey(name: 'has_attachment')
  bool get hasAttachment;
  @override
  @JsonKey(name: 'attachment_id', includeToJson: false)
  int? get attachmentId;
  @override
  @JsonKey(name: 'is_read', includeToJson: false)
  bool get isRead;
  @override
  @JsonKey(name: 'sent_at')
  @DateTimeJsonConverter()
  DateTime? get sentAt;
  @override
  @JsonKey(name: 'message_id', includeToJson: false)
  int? get messageId;
  @override
  @JsonKey(name: 'replied_message', includeToJson: false)
  ChatMessage? get repliedMessage;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
