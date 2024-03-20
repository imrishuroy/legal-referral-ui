import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/pages/signUp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Legal Referral',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
      //LoginScreen
      //onBoardingScreen
    );
  }
}
