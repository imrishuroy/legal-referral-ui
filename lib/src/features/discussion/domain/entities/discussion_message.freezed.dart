// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discussion_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiscussionMessage _$DiscussionMessageFromJson(Map<String, dynamic> json) {
  return _DiscussionMessage.fromJson(json);
}

/// @nodoc
mixin _$DiscussionMessage {
  @JsonKey(name: 'sender_id')
  String get senderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'replied_message', includeIfNull: false)
  DiscussionMessage? get repliedMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'discussion_id')
  int get discussionId => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'sent_at', includeIfNull: false)
  DateTime? get sentAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_message_id', includeIfNull: false)
  int? get parentMessageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_id', includeIfNull: false)
  int? get messageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_first_name', includeIfNull: false)
  String? get senderFirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_last_name', includeIfNull: false)
  String? get senderLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_avatar_image', includeIfNull: false)
  String? get senderAvatarImg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscussionMessageCopyWith<DiscussionMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscussionMessageCopyWith<$Res> {
  factory $DiscussionMessageCopyWith(
          DiscussionMessage value, $Res Function(DiscussionMessage) then) =
      _$DiscussionMessageCopyWithImpl<$Res, DiscussionMessage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'replied_message', includeIfNull: false)
      DiscussionMessage? repliedMessage,
      @JsonKey(name: 'discussion_id') int discussionId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'sent_at', includeIfNull: false)
      DateTime? sentAt,
      @JsonKey(name: 'parent_message_id', includeIfNull: false)
      int? parentMessageId,
      @JsonKey(name: 'message_id', includeIfNull: false) int? messageId,
      @JsonKey(name: 'sender_first_name', includeIfNull: false)
      String? senderFirstName,
      @JsonKey(name: 'sender_last_name', includeIfNull: false)
      String? senderLastName,
      @JsonKey(name: 'sender_avatar_image', includeIfNull: false)
      String? senderAvatarImg});

  $DiscussionMessageCopyWith<$Res>? get repliedMessage;
}

/// @nodoc
class _$DiscussionMessageCopyWithImpl<$Res, $Val extends DiscussionMessage>
    implements $DiscussionMessageCopyWith<$Res> {
  _$DiscussionMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? message = null,
    Object? repliedMessage = freezed,
    Object? discussionId = null,
    Object? sentAt = freezed,
    Object? parentMessageId = freezed,
    Object? messageId = freezed,
    Object? senderFirstName = freezed,
    Object? senderLastName = freezed,
    Object? senderAvatarImg = freezed,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      repliedMessage: freezed == repliedMessage
          ? _value.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as DiscussionMessage?,
      discussionId: null == discussionId
          ? _value.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentMessageId: freezed == parentMessageId
          ? _value.parentMessageId
          : parentMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      senderFirstName: freezed == senderFirstName
          ? _value.senderFirstName
          : senderFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLastName: freezed == senderLastName
          ? _value.senderLastName
          : senderLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderAvatarImg: freezed == senderAvatarImg
          ? _value.senderAvatarImg
          : senderAvatarImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscussionMessageCopyWith<$Res>? get repliedMessage {
    if (_value.repliedMessage == null) {
      return null;
    }

    return $DiscussionMessageCopyWith<$Res>(_value.repliedMessage!, (value) {
      return _then(_value.copyWith(repliedMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiscussionMessageImplCopyWith<$Res>
    implements $DiscussionMessageCopyWith<$Res> {
  factory _$$DiscussionMessageImplCopyWith(_$DiscussionMessageImpl value,
          $Res Function(_$DiscussionMessageImpl) then) =
      __$$DiscussionMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'replied_message', includeIfNull: false)
      DiscussionMessage? repliedMessage,
      @JsonKey(name: 'discussion_id') int discussionId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'sent_at', includeIfNull: false)
      DateTime? sentAt,
      @JsonKey(name: 'parent_message_id', includeIfNull: false)
      int? parentMessageId,
      @JsonKey(name: 'message_id', includeIfNull: false) int? messageId,
      @JsonKey(name: 'sender_first_name', includeIfNull: false)
      String? senderFirstName,
      @JsonKey(name: 'sender_last_name', includeIfNull: false)
      String? senderLastName,
      @JsonKey(name: 'sender_avatar_image', includeIfNull: false)
      String? senderAvatarImg});

  @override
  $DiscussionMessageCopyWith<$Res>? get repliedMessage;
}

/// @nodoc
class __$$DiscussionMessageImplCopyWithImpl<$Res>
    extends _$DiscussionMessageCopyWithImpl<$Res, _$DiscussionMessageImpl>
    implements _$$DiscussionMessageImplCopyWith<$Res> {
  __$$DiscussionMessageImplCopyWithImpl(_$DiscussionMessageImpl _value,
      $Res Function(_$DiscussionMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? message = null,
    Object? repliedMessage = freezed,
    Object? discussionId = null,
    Object? sentAt = freezed,
    Object? parentMessageId = freezed,
    Object? messageId = freezed,
    Object? senderFirstName = freezed,
    Object? senderLastName = freezed,
    Object? senderAvatarImg = freezed,
  }) {
    return _then(_$DiscussionMessageImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      repliedMessage: freezed == repliedMessage
          ? _value.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as DiscussionMessage?,
      discussionId: null == discussionId
          ? _value.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentMessageId: freezed == parentMessageId
          ? _value.parentMessageId
          : parentMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      senderFirstName: freezed == senderFirstName
          ? _value.senderFirstName
          : senderFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLastName: freezed == senderLastName
          ? _value.senderLastName
          : senderLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderAvatarImg: freezed == senderAvatarImg
          ? _value.senderAvatarImg
          : senderAvatarImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscussionMessageImpl implements _DiscussionMessage {
  const _$DiscussionMessageImpl(
      {@JsonKey(name: 'sender_id') required this.senderId,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'replied_message', includeIfNull: false)
      required this.repliedMessage,
      @JsonKey(name: 'discussion_id') required this.discussionId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'sent_at', includeIfNull: false)
      this.sentAt,
      @JsonKey(name: 'parent_message_id', includeIfNull: false)
      this.parentMessageId,
      @JsonKey(name: 'message_id', includeIfNull: false) this.messageId,
      @JsonKey(name: 'sender_first_name', includeIfNull: false)
      this.senderFirstName,
      @JsonKey(name: 'sender_last_name', includeIfNull: false)
      this.senderLastName,
      @JsonKey(name: 'sender_avatar_image', includeIfNull: false)
      this.senderAvatarImg});

  factory _$DiscussionMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscussionMessageImplFromJson(json);

  @override
  @JsonKey(name: 'sender_id')
  final String senderId;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'replied_message', includeIfNull: false)
  final DiscussionMessage? repliedMessage;
  @override
  @JsonKey(name: 'discussion_id')
  final int discussionId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'sent_at', includeIfNull: false)
  final DateTime? sentAt;
  @override
  @JsonKey(name: 'parent_message_id', includeIfNull: false)
  final int? parentMessageId;
  @override
  @JsonKey(name: 'message_id', includeIfNull: false)
  final int? messageId;
  @override
  @JsonKey(name: 'sender_first_name', includeIfNull: false)
  final String? senderFirstName;
  @override
  @JsonKey(name: 'sender_last_name', includeIfNull: false)
  final String? senderLastName;
  @override
  @JsonKey(name: 'sender_avatar_image', includeIfNull: false)
  final String? senderAvatarImg;

  @override
  String toString() {
    return 'DiscussionMessage(senderId: $senderId, message: $message, repliedMessage: $repliedMessage, discussionId: $discussionId, sentAt: $sentAt, parentMessageId: $parentMessageId, messageId: $messageId, senderFirstName: $senderFirstName, senderLastName: $senderLastName, senderAvatarImg: $senderAvatarImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscussionMessageImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.repliedMessage, repliedMessage) ||
                other.repliedMessage == repliedMessage) &&
            (identical(other.discussionId, discussionId) ||
                other.discussionId == discussionId) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.parentMessageId, parentMessageId) ||
                other.parentMessageId == parentMessageId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.senderFirstName, senderFirstName) ||
                other.senderFirstName == senderFirstName) &&
            (identical(other.senderLastName, senderLastName) ||
                other.senderLastName == senderLastName) &&
            (identical(other.senderAvatarImg, senderAvatarImg) ||
                other.senderAvatarImg == senderAvatarImg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      senderId,
      message,
      repliedMessage,
      discussionId,
      sentAt,
      parentMessageId,
      messageId,
      senderFirstName,
      senderLastName,
      senderAvatarImg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscussionMessageImplCopyWith<_$DiscussionMessageImpl> get copyWith =>
      __$$DiscussionMessageImplCopyWithImpl<_$DiscussionMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscussionMessageImplToJson(
      this,
    );
  }
}

abstract class _DiscussionMessage implements DiscussionMessage {
  const factory _DiscussionMessage(
      {@JsonKey(name: 'sender_id') required final String senderId,
      @JsonKey(name: 'message') required final String message,
      @JsonKey(name: 'replied_message', includeIfNull: false)
      required final DiscussionMessage? repliedMessage,
      @JsonKey(name: 'discussion_id') required final int discussionId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'sent_at', includeIfNull: false)
      final DateTime? sentAt,
      @JsonKey(name: 'parent_message_id', includeIfNull: false)
      final int? parentMessageId,
      @JsonKey(name: 'message_id', includeIfNull: false) final int? messageId,
      @JsonKey(name: 'sender_first_name', includeIfNull: false)
      final String? senderFirstName,
      @JsonKey(name: 'sender_last_name', includeIfNull: false)
      final String? senderLastName,
      @JsonKey(name: 'sender_avatar_image', includeIfNull: false)
      final String? senderAvatarImg}) = _$DiscussionMessageImpl;

  factory _DiscussionMessage.fromJson(Map<String, dynamic> json) =
      _$DiscussionMessageImpl.fromJson;

  @override
  @JsonKey(name: 'sender_id')
  String get senderId;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'replied_message', includeIfNull: false)
  DiscussionMessage? get repliedMessage;
  @override
  @JsonKey(name: 'discussion_id')
  int get discussionId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'sent_at', includeIfNull: false)
  DateTime? get sentAt;
  @override
  @JsonKey(name: 'parent_message_id', includeIfNull: false)
  int? get parentMessageId;
  @override
  @JsonKey(name: 'message_id', includeIfNull: false)
  int? get messageId;
  @override
  @JsonKey(name: 'sender_first_name', includeIfNull: false)
  String? get senderFirstName;
  @override
  @JsonKey(name: 'sender_last_name', includeIfNull: false)
  String? get senderLastName;
  @override
  @JsonKey(name: 'sender_avatar_image', includeIfNull: false)
  String? get senderAvatarImg;
  @override
  @JsonKey(ignore: true)
  _$$DiscussionMessageImplCopyWith<_$DiscussionMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
