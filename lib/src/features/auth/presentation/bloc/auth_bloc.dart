import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:signin_with_linkedin/signin_with_linkedin.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthUseCase authUseCase,
  })  : _firebaseAuth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn(
          scopes: [
            'https://www.googleapis.com/auth/userinfo.profile',
            'https://www.googleapis.com/auth/userinfo.email',
          ],
        ),
        _authUseCase = authUseCase,
        super(AuthState.initial()) {
    on<AuthInitialized>(_onAuthInitialized);
    on<AuthTempSignedUp>(_onAuthTempSignedUp);
    on<EmailOTPSent>(_onEmailOTPSent);
    on<EmailOTPVerified>(_onEmailOTPVerified);
    on<MobileOTPRSent>(_onMobileOTPSent);
    on<MobileOTPVerified>(_onMobileOTPVerified);
    on<AuthSignedUp>(_onAuthSignedUp);
    on<AuthSignedIn>(_onAuthSignedIn);
    on<AuthGoogleSignedIn>(_onAuthGoogleSignedIn);
    on<AuthLinkedInSignedIn>(_onAuthLinkedInSignedIn);
    on<AuthFacebookSignedIn>(_onAuthFacebookSignedIn);
    on<AuthUserRequested>(_onAuthUserRequested);
    on<PasswordChanged>(_onPassworChanged);
    on<UserUpdated>(_onUserUpdated);
    on<DeviceDetailsSaved>(_onDeviceDetailsSaved);
    on<AuthSignOutRequested>(_onAuthSignOutRequested);
  }

  final FirebaseAuth _firebaseAuth;
  final AuthUseCase _authUseCase;
  final GoogleSignIn _googleSignIn;

  Future<void> _onAuthInitialized(
    AuthInitialized event,
    Emitter<AuthState> emit,
  ) async {
    final idToken = SharedPrefs.getIDToken();
    final refreshToken = SharedPrefs.getRefreshToken();

    if (idToken == null || refreshToken == null) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.initial,
        ),
      );

      return;
    }

    emit(
      state.copyWith(
        authStatus: AuthStatus.loading,
      ),
    );

    final res = await _authUseCase.refreshToken(
      refreshTokenReq: RefreshTokenReq(
        refreshToken: refreshToken,
        grantType: 'refresh_token',
      ),
    );

    await res.fold(
      (failure) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.initial,
            failure: failure,
          ),
        );
      },
      (data) async {
        if (data == null) {
          emit(
            state.copyWith(
              authStatus: AuthStatus.initial,
              failure: const Failure(
                message: 'Failed to refresh token',
              ),
            ),
          );
          return;
        }
        await SharedPrefs.setIDToken(token: data.idToken);
        await SharedPrefs.setRefreshToken(token: data.refreshToken);

        final userRes = await _authUseCase.getUser(
          userId: data.userId,
        );

        userRes.fold(
          (failure) {
            emit(
              state.copyWith(
                authStatus: AuthStatus.initial,
                failure: failure,
              ),
            );
          },
          (user) {
            if (user == null) {
              emit(
                state.copyWith(
                  authStatus: AuthStatus.initial,
                  failure: const Failure(
                    message: 'Failed to get user',
                  ),
                ),
              );
              return;
            }
            emit(
              state.copyWith(
                user: user,
                authStatus: AuthStatus.signedIn,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onAuthTempSignedUp(
    AuthTempSignedUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        user: AppUser(
          email: event.email,
          firstName: event.firstName,
          lastName: event.lastName,
        ),
      ),
    );

    add(EmailOTPSent(email: event.email));
  }

  Future<void> _onEmailOTPSent(
    EmailOTPSent event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        emailOTPStatus: EmailOTPStatus.loading,
      ),
    );
    final response = await _authUseCase.sendOTP(
      sendOtpReq: SendOtpReq(
        to: event.email,
        channel: 'email',
      ),
    );
    response.fold(
      (failure) {
        emit(
          state.copyWith(
            emailOTPStatus: EmailOTPStatus.failure,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            emailOTPStatus: EmailOTPStatus.sent,
          ),
        );
      },
    );
  }

  Future<void> _onEmailOTPVerified(
    EmailOTPVerified event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        emailOTPStatus: EmailOTPStatus.loading,
      ),
    );

    final response = await _authUseCase.verifyOTP(
      verifyOtpReq: VerifyOtpReq(
        to: event.email,
        otp: event.otp,
        channel: 'email',
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            emailOTPStatus: EmailOTPStatus.failure,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            emailOTPStatus: EmailOTPStatus.verified,
            user: state.user?.copyWith(
              emailVerified: true,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onAuthSignedUp(
    AuthSignedUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        authStatus: AuthStatus.loading,
      ),
    );

    final user = state.user;

    if (user == null) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          failure: const Failure(
            message: 'Failed to sign up',
          ),
        ),
      );
      return;
    }

    if (user.email == null) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          failure: const Failure(
            message: 'Failed to sign up',
          ),
        ),
      );
      return;
    }

    final res = await _authUseCase.signUpWithEmail(
      emailSignUpReq: EmailSignUpReq(
        email: user.email!,
        password: event.password,
        firstName: user.firstName ?? '',
        lastName: user.lastName ?? '',
        mobile: user.mobile ?? '',
        avararFile: File(event.userImageFile.path),
      ),
    );

    await res.fold(
      (failure) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.failure,
            failure: failure,
          ),
        );
      },
      (data) async {
        if (data == null) {
          emit(
            state.copyWith(
              authStatus: AuthStatus.failure,
              failure: const Failure(
                message: 'Failed to sign up',
              ),
            ),
          );
          return;
        }
        final idToken = data.idToken;
        await SharedPrefs.setIDToken(token: idToken);
        await SharedPrefs.setRefreshToken(token: data.refreshToken);
        await SharedPrefs.setAppUser(
          appUser: data.user,
        );
        emit(
          state.copyWith(
            user: data.user,
            authStatus: AuthStatus.signedUp,
          ),
        );
      },
    );
  }

  Future<void> _onAuthSignedIn(
    AuthSignedIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        authStatus: AuthStatus.loading,
      ),
    );

    final res = await _authUseCase.signInWithEmail(
      emailSignInReq: EmailSignInReq(
        email: event.email,
        password: event.password,
      ),
    );

    await res.fold(
      (failure) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.failure,
            failure: failure,
          ),
        );
      },
      (data) async {
        if (data == null) {
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
        final idToken = data.idToken;
        await SharedPrefs.setIDToken(token: idToken);
        await SharedPrefs.setRefreshToken(token: data.refreshToken);
        await SharedPrefs.setAppUser(
          appUser: data.user,
        );
        emit(
          state.copyWith(
            user: data.user,
            authStatus: AuthStatus.signedIn,
          ),
        );
      },
    );
  }

  Future<void> _onAuthGoogleSignedIn(
    AuthGoogleSignedIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
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

      // final accessToken = googleAuth?.accessToken;

      final accessToken = userCred.credential?.accessToken;
      AppLogger.info('Google access token: $accessToken');

      final idToken = await userCred.user?.getIdToken();
      if (idToken != null) {
        await SharedPrefs.setIDToken(token: idToken);
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

      AppUser? checkUser;

      final dbUser = await _authUseCase.getUser(
        userId: user.uid,
      );

      await dbUser.fold(
        (failure) {
          emit(
            state.copyWith(
              authStatus: AuthStatus.failure,
              failure: failure,
            ),
          );
        },
        (dbUser) async {
          checkUser = dbUser;
          if (dbUser != null) {
            await SharedPrefs.setAppUser(
              appUser: dbUser,
            );
            emit(
              state.copyWith(
                user: dbUser,
                authStatus: AuthStatus.signedIn,
              ),
            );
            return;
          }
        },
      );
      if (checkUser == null) {
        final userRes = await _authUseCase.createUser(
          email: user.email!,
          firstName: firstName,
          lastName: lastName,
          mobile: '',
          imageUrl: user.photoURL,
          signUpMethod: 1,
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
              ),
            );
          },
        );
      }
    } on FirebaseAuthException catch (error) {
      AppLogger.error('Firebase Google Auth Error: $error');
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          failure: Failure(
            message: error.message ?? 'Failed to sign in',
          ),
        ),
      );
    } catch (error) {
      AppLogger.error('Google Auth Error 2: $error');
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

  Future<void> _onAuthLinkedInSignedIn(
    AuthLinkedInSignedIn event,
    Emitter<AuthState> emit,
  ) async {
    if (event.accesToken == null || event.email == null) {
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

    emit(
      state.copyWith(
        authStatus: AuthStatus.loading,
      ),
    );

    final res = await _authUseCase.signInWithLinkedIn(
      signInWithLinkedInReq: LinkedinSignInReq(
        accessToken: event.accesToken!,
        email: event.email!,
      ),
    );

    await res.fold(
      (failure) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.failure,
            failure: failure,
          ),
        );
      },
      (authRes) async {
        if (authRes == null) {
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

        final userCed =
            await _firebaseAuth.signInWithCustomToken(authRes.token);

        final idToken = await userCed.user?.getIdToken();
        AppLogger.info('Firebase id token $idToken');
        if (idToken != null) {
          await SharedPrefs.setIDToken(token: idToken);
        }

        AppUser? checkUser;

        final dbUser = await _authUseCase.getUser(
          userId: userCed.user?.uid ?? '',
        );

        await dbUser.fold(
          (failure) {
            emit(
              state.copyWith(
                authStatus: AuthStatus.failure,
                failure: failure,
              ),
            );
          },
          (dbUser) async {
            checkUser = dbUser;
            if (dbUser != null) {
              await SharedPrefs.setAppUser(
                appUser: dbUser,
              );
              emit(
                state.copyWith(
                  user: dbUser,
                  authStatus: AuthStatus.signedIn,
                ),
              );
              return;
            }
          },
        );
        if (checkUser == null) {
          final userRes = await _authUseCase.createUser(
            email: event.email!,
            firstName: event.firstName ?? '',
            lastName: event.lastName ?? '',
            mobile: '',
            imageUrl: event.imageUrl ?? '',
            signUpMethod: 2,
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
                ),
              );
            },
          );
        }
      },
    );
  }

  Future<void> _onAuthFacebookSignedIn(
    AuthFacebookSignedIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          authStatus: AuthStatus.loading,
        ),
      );

      final loginResult = await FacebookAuth.instance.login();
      AppLogger.info('Facebook login result: ${loginResult.status}');
      if (loginResult.status != LoginStatus.success) {
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
      final accessToken = loginResult.accessToken?.token;
      if (accessToken == null) {
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

      final facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken);

      final userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      final idToken = await userCredential.user?.getIdToken();
      if (idToken != null) {
        await SharedPrefs.setIDToken(token: idToken);
      }

      final user = userCredential.user;
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

      AppUser? checkUser;

      final dbUser = await _authUseCase.getUser(
        userId: user.uid,
      );

      await dbUser.fold(
        (failure) {
          emit(
            state.copyWith(
              authStatus: AuthStatus.failure,
              failure: failure,
            ),
          );
        },
        (dbUser) async {
          checkUser = dbUser;
          if (dbUser != null) {
            await SharedPrefs.setAppUser(
              appUser: dbUser,
            );
            emit(
              state.copyWith(
                user: dbUser,
                authStatus: AuthStatus.signedIn,
              ),
            );
            return;
          }
        },
      );
      if (checkUser == null) {
        final userRes = await _authUseCase.createUser(
          email: user.email!,
          firstName: firstName,
          lastName: lastName,
          mobile: '',
          imageUrl: user.photoURL,
          signUpMethod: 1,
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
              ),
            );
          },
        );
      }
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          failure: Failure(
            message: error.message ?? 'Failed to sign in',
          ),
        ),
      );
    } catch (_) {
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
            ),
          );
        } else {
          emit(
            state.copyWith(
              authStatus: AuthStatus.failure,
            ),
          );
        }
      },
    );
  }

  Future<void> _onMobileOTPSent(
    MobileOTPRSent event,
    Emitter<AuthState> emit,
  ) async {
    final user = state.user;
    if (user == null) {
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
        mobileOTPStatus: MobileOTPStatus.loading,
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
    if (user == null) {
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
        mobileOTPStatus: MobileOTPStatus.loading,
      ),
    );

    final response = await _authUseCase.verifyOTP(
      verifyOtpReq: VerifyOtpReq(
        userId: user.userId ?? '',
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
            user: state.user?.copyWith(
              mobile: event.mobile,
              mobileVerified: true,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onPassworChanged(
    PasswordChanged event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        resetPasswordStatus: ResetPasswordStatus.loading,
      ),
    );

    final response = await _authUseCase.resetPassword(
      resetPasswordReq: ResetPasswordReq(
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) {
        emit(
          state.copyWith(
            resetPasswordStatus: ResetPasswordStatus.failed,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            resetPasswordStatus: ResetPasswordStatus.success,
          ),
        );
      },
    );
  }

  Future<void> _onUserUpdated(
    UserUpdated event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        user: event.user,
      ),
    );
  }

  Future<void> _onDeviceDetailsSaved(
    DeviceDetailsSaved event,
    Emitter<AuthState> emit,
  ) async {
    await _authUseCase.saveDeviceDetails(
      deviceDetails: event.deviceDetails,
    );
  }

  Future<void> _onAuthSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await SharedPrefs.removeUser();
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    await SignInWithLinkedIn.logout();
    add(AuthInitialized());
  }
}
