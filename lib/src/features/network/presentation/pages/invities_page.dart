import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';

class InvitesPage extends StatefulWidget {
  const InvitesPage({super.key});

  @override
  State<InvitesPage> createState() => _InvitesPageState();
}

class _InvitesPageState extends State<InvitesPage> {
  final _authBloc = getIt<AuthBloc>();
  final _networkBloc = getIt<NetworkBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _networkBloc.add(
        ConnectionInvitationsFetched(
          userId: userId,
          offset: 1,
          limit: 10,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invites',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocConsumer<NetworkBloc, NetworkState>(
        bloc: _networkBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == NetworkStatus.loading) {
            return const CustomLoadingIndicator();
          }
          final invitations = _networkBloc.state.connectionInvitations;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: ListView.builder(
              itemCount: invitations.length,
              itemBuilder: (BuildContext context, int index) {
                final invitation = invitations[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: InviteCard(
                    invitation: invitation,
                    onAccept: () {
                      final userId = _authBloc.state.user?.userId;
                      if (invitation?.id != null && userId != null) {
                        _networkBloc.add(
                          ConnectionAccepted(
                            connectionId: invitation!.id!,
                            userId: userId,
                          ),
                        );
                      }
                    },
                    onReject: () {},
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
