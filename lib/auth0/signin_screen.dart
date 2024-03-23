import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late Auth0 auth0;
  late GoogleSignIn googleSignIn;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);

    googleSignIn = GoogleSignIn(
      forceCodeForRefreshToken: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await googleSignIn.signOut();
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text('SignIn Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(200, 50),
                ),
                onPressed: _signIn,
                child: const Text('Sign In'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(200, 50),
                ),
                onPressed: _googleSignIn,
                child: const Text('Googke Sign In'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(child: Text('Don\'t have an account?')),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Function to generate a random nonce
  String generateNonce() {
    final random = Random.secure();
    final nonceBytes = List.generate(32, (index) => random.nextInt(256));
    return base64UrlEncode(nonceBytes);
  }

  Future<void> _signIn() async {
    try {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final idToken = await user.user?.getIdToken();
      dev.log('idToken: $idToken');

      // final credentials = await auth0.api.login(
      //   usernameOrEmail: email,
      //   password: password,
      //   connectionOrRealm: 'Username-Password-Authentication',
      //   audience: dotenv.env['AUTH0_AUDIENCE']!,
      //   scopes: {'read:posts'},
      //   parameters: {},
      // );

      // debugPrint('Email Verified: ${credentials.user.isEmailVerified}');
      // debugPrint('access token: ${credentials.accessToken}\n');
      // debugPrint('id token: ${credentials.idToken}');
      // dev.log('id token: ${credentials.idToken}\n');
      // dev.log('access token: ${credentials.accessToken}\n');

      // Store the credentials
      // auth0.credentialsManager.storeCredentials(credentials);
    } on ApiException catch (e) {
      debugPrint('ApiException: ${e.toString()}');
    }
  }

  Future<void> _googleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      // final idToken = await user.user?.getIdToken();
      // debugPrint('Id Token: $idToken');

      final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
      // debugPrint('Id Token: $idToken');
      dev.log('Id Token: $idToken');
    } catch (e) {
      debugPrint('Google Sign In Error: ${e.toString()}');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
