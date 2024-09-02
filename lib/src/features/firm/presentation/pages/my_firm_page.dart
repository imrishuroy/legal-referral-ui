import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/pages/add_law_firm_page.dart';

class MyLawFirmPage extends StatefulWidget {
  const MyLawFirmPage({
    super.key,
  });

  static const String name = 'MyLawFirmPage';

  @override
  State<MyLawFirmPage> createState() => _MyLawFirmPageState();
}

class _MyLawFirmPageState extends State<MyLawFirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Law Firm'),
      ),
      body: Column(
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              iconColor: Colors.blue,
            ),
            onPressed: () => context.pushNamed(
              AddLawFirmPage.name,
            ),
            icon: const Icon(Icons.add),
            label: const Text(
              'Create a Firm Page',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
