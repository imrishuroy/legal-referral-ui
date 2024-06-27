import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/widgets/firm_tile.dart';

class FirmPage extends StatelessWidget {
  const FirmPage({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(title, style: textTheme.headlineLarge),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return const FirmTile();
        },
      ),
      // when db.list.isEmpty
      // const InitialFirm(),
    );
  }
}
