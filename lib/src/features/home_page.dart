import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String name = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: TextButton(
          onPressed: () => LogoutManager.performLogout(),
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}
