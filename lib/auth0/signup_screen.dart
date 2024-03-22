import 'dart:developer' as dev;

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late Auth0 auth0;

  @override
  void initState() {
    super.initState();

    auth0 = Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              onPressed: _signUp,
              child: const Text('Sign Up'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(child: Text('Already have an account?')),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    try {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      final DatabaseUser user = await auth0.api.signup(
        email: email,
        password: password,
        connection: 'Username-Password-Authentication',
      );

      final credentials = await auth0.api.login(
        usernameOrEmail: user.email,
        password: password,
        connectionOrRealm: 'Username-Password-Authentication',
        audience: dotenv.env['AUTH0_AUDIENCE']!,
        scopes: {'read:posts'},
        parameters: {},
      );

      dev.log('accessToken: ${credentials.accessToken}');
      dev.log('idToken: ${credentials.idToken}');
    } catch (e) {
      // It throws ApiException
      dev.log('Error: ${e.runtimeType}');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
