// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/features/auth/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;
  AuthUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  Future<Either<Failure, UserCredential?>> signIn({
    required String userName,
    required String password,
  }) async {
    return _authRepository.signIn(
      userName: userName,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  Future<Either<Failure, UserCredential?>> signUp({
    required String email,
  }) async {
    return _authRepository.signUp(
      email: email,
    );
  }
}
