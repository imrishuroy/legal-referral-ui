import 'package:flutter/material.dart';

class MyLawFirmPage extends StatelessWidget {
  const MyLawFirmPage({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Welcome to $title page!'),
      ),
    );
  }
}
