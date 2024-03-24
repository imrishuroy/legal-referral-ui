import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;
  final AuthDataSource _authDataSource;

  @override
  Future<Either<Failure, AppUser?>> signUp({
    required AppUser appUser,
  }) async {
    try {
      final response = await _authDataSource.signUp(
        appUser: appUser,
      );
      return Right(response);
    } on FirebaseAuthException catch (error) {
      return Left(
        Failure(
          message: error.message ?? error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AppUser?>> signIn({
    required String email,
  }) async {
    try {
      final userCredential = await _authDataSource.signIn(
        signInReq: SignInReq(
          email: email,
        ),
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (error) {
      return Left(
        Failure(
          message: error.message ?? error.toString(),
        ),
      );
    }
  }

  // @override
  // Future<Either<Failure, AppUser>> getUser({
  //   required String? id,
  // }) async {
  //   try {
  //     final response = await _authDataSource.getUser(id: id);
  //     return Right(response);
  //   } on DioException catch (error) {
  //     debugPrint('Error ${error.response?.data}');
  //     return Left(
  //       Failure(
  //         message: error.response?.data.toString() ?? error.toString(),
  //       ),
  //     );
  //   }
  // }
}
