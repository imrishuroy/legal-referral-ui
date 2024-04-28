import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';

class InvitesSection extends StatefulWidget {
  const InvitesSection({
    required this.networkBloc,
    super.key,
  });

  final NetworkBloc networkBloc;

  @override
  State<InvitesSection> createState() => _InvitesSectionState();
}

class _InvitesSectionState extends State<InvitesSection> {
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      widget.networkBloc.add(
        ConnectionInvitationsFetched(
          userId: userId,
          offset: 1,
          limit: 2,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NetworkBloc, NetworkState>(
      bloc: widget.networkBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.inviteStatus == InviteStatus.loading) {
          return const CustomLoadingIndicator();
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.connectionInvitations.length,
          itemBuilder: (BuildContext context, int index) {
            final invitation = state.connectionInvitations[index];
            return InviteCard(
              invitation: invitation,
              onAccept: () {
                final userId = _authBloc.state.user?.userId;
                if (invitation?.id != null && userId != null) {
                  widget.networkBloc.add(
                    ConnectionAccepted(
                      connectionId: invitation!.id!,
                      userId: userId,
                    ),
                  );
                }
              },
              onReject: () {},
            );
          },
        );
      },
    );
  }
}
