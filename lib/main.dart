import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/features/more_details/presentation/pages/personal_detail_screen.dart';

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
      home: PersonalDetailsScreen(),
      //LoginScreen
      //onBoardingScreen
    );
  }
}
