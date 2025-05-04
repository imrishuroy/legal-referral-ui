// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FAQ {
  String get question;
  String get answer;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime? get createdAt;
  @JsonKey(name: 'faq_id', includeToJson: false)
  int? get id;

  /// Create a copy of FAQ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FAQCopyWith<FAQ> get copyWith =>
      _$FAQCopyWithImpl<FAQ>(this as FAQ, _$identity);

  /// Serializes this FAQ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FAQ &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer, createdAt, id);

  @override
  String toString() {
    return 'FAQ(question: $question, answer: $answer, createdAt: $createdAt, id: $id)';
  }
}

/// @nodoc
abstract mixin class $FAQCopyWith<$Res> {
  factory $FAQCopyWith(FAQ value, $Res Function(FAQ) _then) = _$FAQCopyWithImpl;
  @useResult
  $Res call(
      {String question,
      String answer,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: 'faq_id', includeToJson: false) int? id});
}

/// @nodoc
class _$FAQCopyWithImpl<$Res> implements $FAQCopyWith<$Res> {
  _$FAQCopyWithImpl(this._self, this._then);

  final FAQ _self;
  final $Res Function(FAQ) _then;

  /// Create a copy of FAQ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
    Object? createdAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FAQ implements FAQ {
  const _FAQ(
      {required this.question,
      required this.answer,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      this.createdAt,
      @JsonKey(name: 'faq_id', includeToJson: false) this.id});
  factory _FAQ.fromJson(Map<String, dynamic> json) => _$FAQFromJson(json);

  @override
  final String question;
  @override
  final String answer;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeToJson: false)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'faq_id', includeToJson: false)
  final int? id;

  /// Create a copy of FAQ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FAQCopyWith<_FAQ> get copyWith =>
      __$FAQCopyWithImpl<_FAQ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FAQToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FAQ &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer, createdAt, id);

  @override
  String toString() {
    return 'FAQ(question: $question, answer: $answer, createdAt: $createdAt, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$FAQCopyWith<$Res> implements $FAQCopyWith<$Res> {
  factory _$FAQCopyWith(_FAQ value, $Res Function(_FAQ) _then) =
      __$FAQCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String question,
      String answer,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: 'faq_id', includeToJson: false) int? id});
}

/// @nodoc
class __$FAQCopyWithImpl<$Res> implements _$FAQCopyWith<$Res> {
  __$FAQCopyWithImpl(this._self, this._then);

  final _FAQ _self;
  final $Res Function(_FAQ) _then;

  /// Create a copy of FAQ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? question = null,
    Object? answer = null,
    Object? createdAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_FAQ(
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
