// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInReq _$SignInReqFromJson(Map<String, dynamic> json) {
  return _SignInReq.fromJson(json);
}

/// @nodoc
mixin _$SignInReq {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInReqCopyWith<SignInReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInReqCopyWith<$Res> {
  factory $SignInReqCopyWith(SignInReq value, $Res Function(SignInReq) then) =
      _$SignInReqCopyWithImpl<$Res, SignInReq>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$SignInReqCopyWithImpl<$Res, $Val extends SignInReq>
    implements $SignInReqCopyWith<$Res> {
  _$SignInReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInReqImplCopyWith<$Res>
    implements $SignInReqCopyWith<$Res> {
  factory _$$SignInReqImplCopyWith(
          _$SignInReqImpl value, $Res Function(_$SignInReqImpl) then) =
      __$$SignInReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SignInReqImplCopyWithImpl<$Res>
    extends _$SignInReqCopyWithImpl<$Res, _$SignInReqImpl>
    implements _$$SignInReqImplCopyWith<$Res> {
  __$$SignInReqImplCopyWithImpl(
      _$SignInReqImpl _value, $Res Function(_$SignInReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SignInReqImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignInReqImpl implements _SignInReq {
  const _$SignInReqImpl({required this.email});

  factory _$SignInReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInReqImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'SignInReq(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInReqImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInReqImplCopyWith<_$SignInReqImpl> get copyWith =>
      __$$SignInReqImplCopyWithImpl<_$SignInReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInReqImplToJson(
      this,
    );
  }
}

abstract class _SignInReq implements SignInReq {
  const factory _SignInReq({required final String email}) = _$SignInReqImpl;

  factory _SignInReq.fromJson(Map<String, dynamic> json) =
      _$SignInReqImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$SignInReqImplCopyWith<_$SignInReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
