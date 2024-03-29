import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthUseCase authUseCase,
  })  : _firebaseAuth = FirebaseAuth.instance,
        _authUseCase = authUseCase,
        super(AuthState.initial()) {
    on<AuthSignedIn>(_onAuthSignedIn);
    on<AuthSignedUp>(_onAuthSignedUp);
    on<AuthSignOutRequested>(_onAuthSignOutRequested);
    on<EmailOtpResend>(_onEmailOtpResend);
    on<EmailOtpVerified>(_onEmailOtpVerified);
  }
  final FirebaseAuth _firebaseAuth;
  final AuthUseCase _authUseCase;

  Future<void> _onAuthSignedUp(
    AuthSignedUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        authStatus: AuthStatus.loading,
      ),
    );

    final userRes = await _authUseCase.signUp(
      appUser: AppUser(
        email: event.email,
        firstName: event.firstName,
        lastName: event.lastName,
        isEmailVerified: true,
      ),
    );

    await userRes.fold(
      (failure) {
        emit(
          state.copyWith(
            failure: failure,
            authStatus: AuthStatus.failure,
          ),
        );
      },
      (res) async {
        if (res?.appUser == null) {
          emit(
            state.copyWith(
              authStatus: AuthStatus.failure,
              failure: const Failure(
                message: 'Failed to sign in',
              ),
            ),
          );
          return;
        }
        await SharedPrefs.setAppUser(
          appUser: res!.appUser!,
        );

        emit(
          state.copyWith(
            user: res.appUser,
            sessionId: res.sessionId,
            authStatus: AuthStatus.signedUp,
            emailOtpStatus: EmailOtpStatus.sent,
          ),
        );
      },
    );
  }

  Future<void> _onAuthSignedIn(
    AuthSignedIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          authStatus: AuthStatus.loading,
        ),
      );

      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (user.user == null || user.user?.email == null) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.failure,
            failure: const Failure(
              message: 'Failed to sign in',
            ),
          ),
        );
        return;
      }

      final idToken = await user.user?.getIdToken();
      if (idToken != null) {
        await SharedPrefs.setToken(token: idToken);
      }

      final userRes = await _authUseCase.signIn(
        email: user.user!.email!,
      );

      await userRes.fold(
        (failure) {
          emit(
            state.copyWith(
              authStatus: AuthStatus.failure,
              failure: failure,
            ),
          );
        },
        (user) async {
          if (user == null) {
            emit(
              state.copyWith(
                authStatus: AuthStatus.failure,
                failure: const Failure(
                  message: 'Failed to sign in',
                ),
              ),
            );
            return;
          }
          await SharedPrefs.setAppUser(
            appUser: user,
          );
          emit(
            state.copyWith(
              user: user,
              authStatus: AuthStatus.signedIn,
              userStatus: UserStatus.authorized,
            ),
          );
        },
      );
    } catch (error) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          failure: const Failure(
            message: 'Failed to sign in',
          ),
        ),
      );
    }
  }

  Future<void> _onEmailOtpVerified(
    EmailOtpVerified event,
    Emitter<AuthState> emit,
  ) async {
    final user = state.user;
    if (user == null || user.id == null || state.sessionId == null) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          failure: const Failure(
            message: 'Failed to verify OTP',
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        emailOtpStatus: EmailOtpStatus.verifying,
      ),
    );

    final response = await _authUseCase.verifyEmailOtp(
      verifyEmailOtpReq: VerifyEmailOtpReq(
        userId: user.id!,
        sessionId: state.sessionId!,
        otp: event.otp,
        channel: 'email',
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            emailOtpStatus: EmailOtpStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            emailOtpStatus: EmailOtpStatus.verified,
          ),
        );
      },
    );
  }

  Future<void> _onEmailOtpResend(
    EmailOtpResend event,
    Emitter<AuthState> emit,
  ) async {
    final user = state.user;
    if (user == null || user.id == null) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          failure: const Failure(
            message: 'Failed to resend OTP',
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        emailOtpStatus: EmailOtpStatus.verifying,
      ),
    );

    final response = await _authUseCase.sendEmailOtp(
      sendEmailOtpReq: SendEmailOtpReq(
        userId: user.id!,
        channel: 'email',
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            emailOtpStatus: EmailOtpStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            sessionId: data?.sessionId,
            emailOtpStatus: EmailOtpStatus.resent,
          ),
        );
      },
    );
  }

  // Future<void> _onAuthUserCreated(
  //   AuthUserCreated event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   emit(
  //     state.copyWith(
  //       authStatus: AuthStatus.loading,
  //     ),
  //   );
  //   final response = await _authUseCase.createUser(
  //     appUser: AppUser(
  //       email: event.email,
  //       name: event.name,
  //     ),
  //   );

  //   await response.fold(
  //     (failure) {
  //       emit(
  //         state.copyWith(
  //           failure: failure,
  //           authStatus: AuthStatus.failure,
  //         ),
  //       );
  //     },
  //     (user) async {
  //       await SharedPrefs.setAppUser(
  //         appUser: AppUser(
  //           id: user.id,
  //           email: user.email,
  //           name: user.name,
  //         ),
  //       );
  //       emit(
  //         state.copyWith(
  //           userStatus: UserStatus.authorized,
  //           user: user,
  //         ),
  //       );
  //     },
  //   );
  // }

  Future<void> _onAuthSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _firebaseAuth.signOut();
    await SharedPrefs.clear();
    emit(
      AuthState.initial(),
    );
  }
}
