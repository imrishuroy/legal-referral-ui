import 'package:flutter/material.dart';

class SavedPostPage extends StatelessWidget {
  const SavedPostPage({required this.title, super.key});
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
