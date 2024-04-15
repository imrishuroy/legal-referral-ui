import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String name = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: GestureDetector(
            onTap: () => context.pushNamed(ProfilePage.name),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                _authBloc.state.user?.imageUrl ?? '',
              ),
            ),
          ),
        ),
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
