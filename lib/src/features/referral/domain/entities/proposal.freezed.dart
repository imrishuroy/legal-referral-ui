// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Proposal {
  @JsonKey(name: 'project_id')
  int? get referralId;
  @JsonKey(name: 'user_id')
  String? get userId;
  String? get title;
  String? get proposal;
  @JsonKey(name: 'proposal_id', includeIfNull: false)
  int? get proposalId;
  @JsonKey(name: 'status', includeToJson: false)
  ProposalStatus? get status;
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt;
  @JsonKey(name: 'updated_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get updatedAt;

  /// Create a copy of Proposal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProposalCopyWith<Proposal> get copyWith =>
      _$ProposalCopyWithImpl<Proposal>(this as Proposal, _$identity);

  /// Serializes this Proposal to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Proposal &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, referralId, userId, title,
      proposal, proposalId, status, createdAt, updatedAt);

  @override
  String toString() {
    return 'Proposal(referralId: $referralId, userId: $userId, title: $title, proposal: $proposal, proposalId: $proposalId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ProposalCopyWith<$Res> {
  factory $ProposalCopyWith(Proposal value, $Res Function(Proposal) _then) =
      _$ProposalCopyWithImpl;
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
class _$ProposalCopyWithImpl<$Res> implements $ProposalCopyWith<$Res> {
  _$ProposalCopyWithImpl(this._self, this._then);

  final Proposal _self;
  final $Res Function(Proposal) _then;

  /// Create a copy of Proposal
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      referralId: freezed == referralId
          ? _self.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      proposal: freezed == proposal
          ? _self.proposal
          : proposal // ignore: cast_nullable_to_non_nullable
              as String?,
      proposalId: freezed == proposalId
          ? _self.proposalId
          : proposalId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProposalStatus?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Proposal implements Proposal {
  const _Proposal(
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
  factory _Proposal.fromJson(Map<String, dynamic> json) =>
      _$ProposalFromJson(json);

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

  /// Create a copy of Proposal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProposalCopyWith<_Proposal> get copyWith =>
      __$ProposalCopyWithImpl<_Proposal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProposalToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Proposal &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, referralId, userId, title,
      proposal, proposalId, status, createdAt, updatedAt);

  @override
  String toString() {
    return 'Proposal(referralId: $referralId, userId: $userId, title: $title, proposal: $proposal, proposalId: $proposalId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ProposalCopyWith<$Res>
    implements $ProposalCopyWith<$Res> {
  factory _$ProposalCopyWith(_Proposal value, $Res Function(_Proposal) _then) =
      __$ProposalCopyWithImpl;
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
class __$ProposalCopyWithImpl<$Res> implements _$ProposalCopyWith<$Res> {
  __$ProposalCopyWithImpl(this._self, this._then);

  final _Proposal _self;
  final $Res Function(_Proposal) _then;

  /// Create a copy of Proposal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Proposal(
      referralId: freezed == referralId
          ? _self.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      proposal: freezed == proposal
          ? _self.proposal
          : proposal // ignore: cast_nullable_to_non_nullable
              as String?,
      proposalId: freezed == proposalId
          ? _self.proposalId
          : proposalId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProposalStatus?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
