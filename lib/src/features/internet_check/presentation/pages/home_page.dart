import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/features/internet_check/presentation/bloc/internet_check_bloc.dart';
import 'package:legal_referral_ui/src/features/internet_check/presentation/pages/internet_check.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<InternetCheckBloc, InternetCheckState>(
        bloc: BlocProvider.of<InternetCheckBloc>(context),
        listener: (context, state) {
          if (state.internetStatus == InternetCheck.connected) {
            if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('You are connected to the network'),
              ),
            );
          } else if (state.internetStatus == InternetCheck.disconnected) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ConnectionLostPage(),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Check your internet connection'),
              ),
            );
          }
        },
        child: const SizedBox.shrink(),
      ),
    );
  }
}
