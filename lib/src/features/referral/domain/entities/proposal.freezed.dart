// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Proposal _$ProposalFromJson(Map<String, dynamic> json) {
  return _Proposal.fromJson(json);
}

/// @nodoc
mixin _$Proposal {
  @JsonKey(name: 'project_id')
  int? get referralId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get proposal => throw _privateConstructorUsedError;
  @JsonKey(name: 'proposal_id', includeIfNull: false)
  int? get proposalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', includeToJson: false)
  ProposalStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProposalCopyWith<Proposal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProposalCopyWith<$Res> {
  factory $ProposalCopyWith(Proposal value, $Res Function(Proposal) then) =
      _$ProposalCopyWithImpl<$Res, Proposal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'project_id') int? referralId,
      @JsonKey(name: 'user_id') String? userId,
      String? title,
      String? proposal,
      @JsonKey(name: 'proposal_id', includeIfNull: false) int? proposalId,
      @JsonKey(name: 'status', includeToJson: false) ProposalStatus? status,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? updatedAt});
}

/// @nodoc
class _$ProposalCopyWithImpl<$Res, $Val extends Proposal>
    implements $ProposalCopyWith<$Res> {
  _$ProposalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralId = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? proposal = freezed,
    Object? proposalId = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      proposal: freezed == proposal
          ? _value.proposal
          : proposal // ignore: cast_nullable_to_non_nullable
              as String?,
      proposalId: freezed == proposalId
          ? _value.proposalId
          : proposalId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProposalStatus?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProposalImplCopyWith<$Res>
    implements $ProposalCopyWith<$Res> {
  factory _$$ProposalImplCopyWith(
          _$ProposalImpl value, $Res Function(_$ProposalImpl) then) =
      __$$ProposalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'project_id') int? referralId,
      @JsonKey(name: 'user_id') String? userId,
      String? title,
      String? proposal,
      @JsonKey(name: 'proposal_id', includeIfNull: false) int? proposalId,
      @JsonKey(name: 'status', includeToJson: false) ProposalStatus? status,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? updatedAt});
}

/// @nodoc
class __$$ProposalImplCopyWithImpl<$Res>
    extends _$ProposalCopyWithImpl<$Res, _$ProposalImpl>
    implements _$$ProposalImplCopyWith<$Res> {
  __$$ProposalImplCopyWithImpl(
      _$ProposalImpl _value, $Res Function(_$ProposalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralId = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? proposal = freezed,
    Object? proposalId = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProposalImpl(
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      proposal: freezed == proposal
          ? _value.proposal
          : proposal // ignore: cast_nullable_to_non_nullable
              as String?,
      proposalId: freezed == proposalId
          ? _value.proposalId
          : proposalId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProposalStatus?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProposalImpl implements _Proposal {
  const _$ProposalImpl(
      {@JsonKey(name: 'project_id') required this.referralId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.title,
      required this.proposal,
      @JsonKey(name: 'proposal_id', includeIfNull: false) this.proposalId,
      @JsonKey(name: 'status', includeToJson: false)
      this.status = ProposalStatus.active,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      this.createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      @DateTimeJsonConverter()
      this.updatedAt});

  factory _$ProposalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProposalImplFromJson(json);

  @override
  @JsonKey(name: 'project_id')
  final int? referralId;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? title;
  @override
  final String? proposal;
  @override
  @JsonKey(name: 'proposal_id', includeIfNull: false)
  final int? proposalId;
  @override
  @JsonKey(name: 'status', includeToJson: false)
  final ProposalStatus? status;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Proposal(referralId: $referralId, userId: $userId, title: $title, proposal: $proposal, proposalId: $proposalId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProposalImpl &&
            (identical(other.referralId, referralId) ||
                other.referralId == referralId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.proposal, proposal) ||
                other.proposal == proposal) &&
            (identical(other.proposalId, proposalId) ||
                other.proposalId == proposalId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, referralId, userId, title,
      proposal, proposalId, status, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProposalImplCopyWith<_$ProposalImpl> get copyWith =>
      __$$ProposalImplCopyWithImpl<_$ProposalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProposalImplToJson(
      this,
    );
  }
}

abstract class _Proposal implements Proposal {
  const factory _Proposal(
      {@JsonKey(name: 'project_id') required final int? referralId,
      @JsonKey(name: 'user_id') required final String? userId,
      required final String? title,
      required final String? proposal,
      @JsonKey(name: 'proposal_id', includeIfNull: false) final int? proposalId,
      @JsonKey(name: 'status', includeToJson: false)
      final ProposalStatus? status,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      @DateTimeJsonConverter()
      final DateTime? updatedAt}) = _$ProposalImpl;

  factory _Proposal.fromJson(Map<String, dynamic> json) =
      _$ProposalImpl.fromJson;

  @override
  @JsonKey(name: 'project_id')
  int? get referralId;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get title;
  @override
  String? get proposal;
  @override
  @JsonKey(name: 'proposal_id', includeIfNull: false)
  int? get proposalId;
  @override
  @JsonKey(name: 'status', includeToJson: false)
  ProposalStatus? get status;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProposalImplCopyWith<_$ProposalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
