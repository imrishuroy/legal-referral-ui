import 'package:flutter/material.dart';

class DiscussPage extends StatelessWidget {
  const DiscussPage({super.key});

  static const String name = 'DiscussPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Discuss Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
