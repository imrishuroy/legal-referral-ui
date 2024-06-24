
import 'package:flutter/material.dart';

class PostAdPage extends StatelessWidget {
  const PostAdPage({required this.title, super.key});
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
