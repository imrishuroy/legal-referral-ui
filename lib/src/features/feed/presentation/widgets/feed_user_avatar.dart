import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class FeedUserAvatar extends StatefulWidget {
  const FeedUserAvatar({super.key});

  @override
  State<FeedUserAvatar> createState() => _FeedUserAvatarState();
}

class _FeedUserAvatarState extends State<FeedUserAvatar> {
  final _authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _authBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {
              final userId = _authBloc.state.user?.userId;
              if (userId != null) {
                context.pushNamed(
                  ProfilePage.name,
                  pathParameters: {
                    'userId': userId,
                  },
                );
              }
            },
            child: CustomAvatar(
              imageUrl: state.user?.avatarUrl,
            ),
          ),
        );
      },
    );
  }
}
