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
  void initState() {
    BlocProvider.of<InternetCheckBloc>(context).add(CheckConnectivity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InternetCheckBloc, InternetCheckState>(
        listener: (context, state) {
          if (state.internetStatus == InternetCheck.connected) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Connected...'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.internetStatus == InternetCheck.disconnected) {
            return const ConnectionLostPage();
          }
          return const Center(child: Text('home'));
        },
      ),
    );
  }
}
