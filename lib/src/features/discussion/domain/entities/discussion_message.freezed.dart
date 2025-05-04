// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discussion_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscussionMessage {
  @JsonKey(name: 'sender_id')
  String get senderId;
  @JsonKey(name: 'message')
  String get message;
  @JsonKey(name: 'replied_message', includeIfNull: false)
  DiscussionMessage? get repliedMessage;
  @JsonKey(name: 'discussion_id')
  int get discussionId;
  @DateTimeJsonConverter()
  @JsonKey(name: 'sent_at', includeIfNull: false)
  DateTime? get sentAt;
  @JsonKey(name: 'parent_message_id', includeIfNull: false)
  int? get parentMessageId;
  @JsonKey(name: 'message_id', includeIfNull: false)
  int? get messageId;
  @JsonKey(name: 'sender_first_name', includeIfNull: false)
  String? get senderFirstName;
  @JsonKey(name: 'sender_last_name', includeIfNull: false)
  String? get senderLastName;
  @JsonKey(name: 'sender_avatar_image', includeIfNull: false)
  String? get senderAvatarImg;

  /// Create a copy of DiscussionMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DiscussionMessageCopyWith<DiscussionMessage> get copyWith =>
      _$DiscussionMessageCopyWithImpl<DiscussionMessage>(
          this as DiscussionMessage, _$identity);

  /// Serializes this DiscussionMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DiscussionMessage &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'DiscussionMessage(senderId: $senderId, message: $message, repliedMessage: $repliedMessage, discussionId: $discussionId, sentAt: $sentAt, parentMessageId: $parentMessageId, messageId: $messageId, senderFirstName: $senderFirstName, senderLastName: $senderLastName, senderAvatarImg: $senderAvatarImg)';
  }
}

/// @nodoc
abstract mixin class $DiscussionMessageCopyWith<$Res> {
  factory $DiscussionMessageCopyWith(
          DiscussionMessage value, $Res Function(DiscussionMessage) _then) =
      _$DiscussionMessageCopyWithImpl;
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
class _$DiscussionMessageCopyWithImpl<$Res>
    implements $DiscussionMessageCopyWith<$Res> {
  _$DiscussionMessageCopyWithImpl(this._self, this._then);

  final DiscussionMessage _self;
  final $Res Function(DiscussionMessage) _then;

  /// Create a copy of DiscussionMessage
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      repliedMessage: freezed == repliedMessage
          ? _self.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as DiscussionMessage?,
      discussionId: null == discussionId
          ? _self.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentMessageId: freezed == parentMessageId
          ? _self.parentMessageId
          : parentMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      messageId: freezed == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      senderFirstName: freezed == senderFirstName
          ? _self.senderFirstName
          : senderFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLastName: freezed == senderLastName
          ? _self.senderLastName
          : senderLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderAvatarImg: freezed == senderAvatarImg
          ? _self.senderAvatarImg
          : senderAvatarImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of DiscussionMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscussionMessageCopyWith<$Res>? get repliedMessage {
    if (_self.repliedMessage == null) {
      return null;
    }

    return $DiscussionMessageCopyWith<$Res>(_self.repliedMessage!, (value) {
      return _then(_self.copyWith(repliedMessage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _DiscussionMessage implements DiscussionMessage {
  const _DiscussionMessage(
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
  factory _DiscussionMessage.fromJson(Map<String, dynamic> json) =>
      _$DiscussionMessageFromJson(json);

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

  /// Create a copy of DiscussionMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DiscussionMessageCopyWith<_DiscussionMessage> get copyWith =>
      __$DiscussionMessageCopyWithImpl<_DiscussionMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DiscussionMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DiscussionMessage &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'DiscussionMessage(senderId: $senderId, message: $message, repliedMessage: $repliedMessage, discussionId: $discussionId, sentAt: $sentAt, parentMessageId: $parentMessageId, messageId: $messageId, senderFirstName: $senderFirstName, senderLastName: $senderLastName, senderAvatarImg: $senderAvatarImg)';
  }
}

/// @nodoc
abstract mixin class _$DiscussionMessageCopyWith<$Res>
    implements $DiscussionMessageCopyWith<$Res> {
  factory _$DiscussionMessageCopyWith(
          _DiscussionMessage value, $Res Function(_DiscussionMessage) _then) =
      __$DiscussionMessageCopyWithImpl;
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
class __$DiscussionMessageCopyWithImpl<$Res>
    implements _$DiscussionMessageCopyWith<$Res> {
  __$DiscussionMessageCopyWithImpl(this._self, this._then);

  final _DiscussionMessage _self;
  final $Res Function(_DiscussionMessage) _then;

  /// Create a copy of DiscussionMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_DiscussionMessage(
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      repliedMessage: freezed == repliedMessage
          ? _self.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as DiscussionMessage?,
      discussionId: null == discussionId
          ? _self.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentMessageId: freezed == parentMessageId
          ? _self.parentMessageId
          : parentMessageId // ignore: cast_nullable_to_non_nullable
              as int?,
      messageId: freezed == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int?,
      senderFirstName: freezed == senderFirstName
          ? _self.senderFirstName
          : senderFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderLastName: freezed == senderLastName
          ? _self.senderLastName
          : senderLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      senderAvatarImg: freezed == senderAvatarImg
          ? _self.senderAvatarImg
          : senderAvatarImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of DiscussionMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscussionMessageCopyWith<$Res>? get repliedMessage {
    if (_self.repliedMessage == null) {
      return null;
    }

    return $DiscussionMessageCopyWith<$Res>(_self.repliedMessage!, (value) {
      return _then(_self.copyWith(repliedMessage: value));
    });
  }
}

// dart format on
