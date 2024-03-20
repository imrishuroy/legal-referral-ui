import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential?>> signUp({
    required String email,
  });

  Future<Either<Failure, UserCredential?>> signIn({
    required String userName,
    required String password,
  });

  Future<void> signOut();
}
