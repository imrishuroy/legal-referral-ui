import 'dart:async';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'api_card.dart';
import 'web_auth_card.dart';

const double padding = 24.0;

class ExampleApp extends StatefulWidget {
  const ExampleApp({final Key? key}) : super(key: key);

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  bool _isLoggedIn = false;
  String _output = '';

  late Auth0 auth0;
  late WebAuthentication webAuth;
  late Auth0Web auth0Web;

  @override
  void initState() {
    super.initState();

    auth0 = Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
    auth0Web =
        Auth0Web(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
    webAuth =
        auth0.webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME']);

    if (kIsWeb) {
      auth0Web.onLoad().then((final credentials) => setState(() {
            _output = credentials?.idToken ?? '';
            _isLoggedIn = credentials != null;
          }));
    }
  }

  Future<void> webAuthLogin() async {
    String output = '';

    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      if (kIsWeb) {
        return auth0Web.loginWithRedirect(redirectUrl: 'http://localhost:3000');
      }

      // final result = await webAuth.login(useHTTPS: true);
      final result = await webAuth.login();

      setState(() {
        _isLoggedIn = true;
      });

      output = result.idToken;
    } catch (e) {
      output = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _output = output;
    });
  }

  Future<void> webAuthLogout() async {
    String output;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: 'http://localhost:3000');
      } else {
        // await webAuth.logout(useHTTPS: true);
        await webAuth.logout();

        setState(() {
          _isLoggedIn = false;
        });
      }
      output = 'Logged out.';
    } catch (e) {
      output = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _output = output;
    });
  }

  Future<void> apiLogin(
      final String usernameOrEmail, final String password) async {
    String output;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // await auth0.api.loginWithOtp(otp: otp, mfaToken: mfaToken)

      final credentials = await auth0.api.login(
        usernameOrEmail: usernameOrEmail,
        password: password,
        connectionOrRealm: 'Username-Password-Authentication',
        // audience: 'http://localhost:3010',
        audience: 'https://legal-referral-2/api',
        scopes: {'read:posts'},
      );
      //output = result.accessToken;
      debugPrint('result: ${credentials.accessToken}');

      // final user = await auth0.api.userProfile(accessToken: '');

      output = 'Logged in.';
    } on ApiException catch (e) {
      debugPrint('ApiException: ${e.toString()}');
      output = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isLoggedIn = true;
      _output = output;
    });
  }

  Future signUp({
    required String email,
    required String password,
  }) async {
    final DatabaseUser user = await auth0.api.signup(
      email: email,
      password: password,
      connection: 'Username-Password-Authentication',
    );

    debugPrint('user: ${user.isEmailVerified}');
  }

  Future<void> checkMFA() async {
    final challenge = await auth0.api.multifactorChallenge(
      mfaToken: 'mfaToken',
      types: [
        ChallengeType.otp,
      ],
      authenticatorId: 'authenticatorId',
    );

    debugPrint('challenge: $challenge');
  }

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(title: const Text('Auth0 Example')),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ApiCard(action: apiLogin),
                      if (_isLoggedIn)
                        WebAuthCard(
                            label: 'Web Auth Logout', action: webAuthLogout)
                      else
                        WebAuthCard(
                            label: 'Web Auth Login', action: webAuthLogin),
                    ]),
              )),
              SliverFillRemaining(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          padding, 0.0, padding, padding),
                      child: Center(child: Text(_output)))),
            ],
          )),
    );
  }
}
