import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthUseCase authUseCase,
  })  : _firebaseAuth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn(),
        _authUseCase = authUseCase,
        super(AuthState.initial()) {
    on<AuthSignedUp>(_onAuthSignedUp);
    on<AuthSignedIn>(_onAuthSignedIn);
    on<AuthGoogleSignedIn>(_onAuthGoogleSignedIn);
    on<AuthUserRequested>(_onAuthUserRequested);
    on<EmailOTPResend>(_onEmailOTPResend);
    on<EmailOTPVerified>(_onEmailOTPVerified);
    on<MobileOTPRequested>(_onMobileOTPRequested);
    on<MobileOTPVerified>(_onMobileOTPVerified);
    on<AuthSignOutRequested>(_onAuthSignOutRequested);
  }
  final FirebaseAuth _firebaseAuth;
  final AuthUseCase _authUseCase;
  final GoogleSignIn _googleSignIn;

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

        // const errorMsg = 'user with email already exists';
        // debugPrint('failure: ${failure.message}');

        // if (errorMsg == failure.message) {
        //   emit(
        //     state.copyWith(
        //       failure: failure,
        //       authStatus: AuthStatus.failure,
        //     ),
        //   );
        //   add(EmailOtpResend(email: event.email));
        // } else {
        //   emit(
        //     state.copyWith(
        //       failure: failure,
        //       authStatus: AuthStatus.failure,
        //     ),
        //   );
        // }
      },
      (user) async {
        debugPrint('userRes auth bloc: $user}');
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
            authStatus: AuthStatus.signedUp,
            emailOTPStatus: EmailOTPStatus.sent,
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

  Future<void> _onAuthGoogleSignedIn(
    AuthGoogleSignedIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        authStatus: AuthStatus.loading,
      ),
    );

    await _googleSignIn.signOut();

    final googleUser = await _googleSignIn.signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCred =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (idToken != null) {
      debugPrint('Id Token: $idToken');
      await SharedPrefs.setToken(token: idToken);
    }

    final user = userCred.user;
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
    final displayName = user.displayName;

    String? firstName = '';
    String? lastName = '';

    if (displayName != null && displayName.isNotEmpty) {
      final nameParts = displayName.split(' ');
      if (nameParts.isNotEmpty) {
        firstName = nameParts.first;
      }
      if (nameParts.length >= 2) {
        lastName = nameParts.last;
      }
    }

    final userRes = await _authUseCase.signUp(
      appUser: AppUser(
        email: user.email!,
        firstName: firstName,
        lastName: lastName,
        isEmailVerified: true,
      ),
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
  }

  Future<void> _onAuthUserRequested(
    AuthUserRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        authStatus: AuthStatus.loading,
      ),
    );

    final userRes = await _authUseCase.getUser(
      userId: event.userId,
    );

    await userRes.fold(
      (failure) async {
        await SharedPrefs.removeUser();
        emit(
          state.copyWith(
            authStatus: AuthStatus.failure,
            failure: failure,
          ),
        );
      },
      (user) async {
        if (user != null) {
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
        }
      },
    );
  }

  Future<void> _onEmailOTPVerified(
    EmailOTPVerified event,
    Emitter<AuthState> emit,
  ) async {
    final user = state.user;
    // if (user == null || state.sessionId == null) {
    //   emit(
    //     state.copyWith(
    //       authStatus: AuthStatus.failure,
    //       failure: const Failure(
    //         message: 'Failed to verify OTP',
    //       ),
    //     ),
    //   );
    //   return;
    // }

    emit(
      state.copyWith(
        emailOTPStatus: EmailOTPStatus.verifying,
      ),
    );

    final email = event.email ?? user?.email;
    if (email == null || user?.userId == null) {
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

    final response = await _authUseCase.verifyOTP(
      verifyOtpReq: VerifyOtpReq(
        userId: user!.userId!,
        to: email,
        otp: event.otp,
        channel: 'email',
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            emailOTPStatus: EmailOTPStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            emailOTPStatus: EmailOTPStatus.verified,
          ),
        );
      },
    );
  }

  Future<void> _onEmailOTPResend(
    EmailOTPResend event,
    Emitter<AuthState> emit,
  ) async {
    final user = state.user;

    emit(
      state.copyWith(
        emailOTPStatus: EmailOTPStatus.verifying,
      ),
    );

    final email = event.email ?? user?.email;
    if (email == null) {
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

    final response = await _authUseCase.sendOTP(
      sendOtpReq: SendOtpReq(
        to: email,
        channel: 'email',
      ),
    );
    response.fold(
      (failure) {
        emit(
          state.copyWith(
            emailOTPStatus: EmailOTPStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            emailOTPStatus: EmailOTPStatus.resent,
          ),
        );
      },
    );
  }

  Future<void> _onMobileOTPRequested(
    MobileOTPRequested event,
    Emitter<AuthState> emit,
  ) async {
    final user = state.user;
    if (user == null || user.userId == null) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          failure: const Failure(
            message: 'Failed to request OTP',
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        mobileOTPStatus: MobileOTPStatus.verifying,
      ),
    );

    final response = await _authUseCase.sendOTP(
      sendOtpReq: SendOtpReq(
        to: event.mobile,
        channel: 'sms',
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            mobileOTPStatus: MobileOTPStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            mobileOTPStatus: MobileOTPStatus.sent,
          ),
        );
      },
    );
  }

  Future<void> _onMobileOTPVerified(
    MobileOTPVerified event,
    Emitter<AuthState> emit,
  ) async {
    final user = state.user;
    if (user == null || user.userId == null) {
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
        mobileOTPStatus: MobileOTPStatus.verifying,
      ),
    );

    final response = await _authUseCase.verifyOTP(
      verifyOtpReq: VerifyOtpReq(
        userId: user.userId!,
        to: event.mobile,
        otp: event.otp,
        channel: 'sms',
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            mobileOTPStatus: MobileOTPStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            mobileOTPStatus: MobileOTPStatus.verified,
          ),
        );
      },
    );
  }

  Future<void> _onAuthSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      AuthState.initial(),
    );
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    await SharedPrefs.removeUser();
  }
}
