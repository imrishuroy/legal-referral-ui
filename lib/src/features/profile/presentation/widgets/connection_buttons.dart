import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/data/data.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

class ConnectionButtons extends StatefulWidget {
  const ConnectionButtons({required this.userId, super.key});

  final String userId;

  @override
  State<ConnectionButtons> createState() => _ConnectionButtonsState();
}

class _ConnectionButtonsState extends State<ConnectionButtons> {
  final _networkBloc = getIt<NetworkBloc>();
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;

    if (userId != null) {
      _networkBloc.add(
        ConnectionChecked(
          userId: userId,
          otherUserId: widget.userId,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      bloc: _networkBloc,
      builder: (context, state) {
        // if (state.status == NetworkStatus.loading) {
        //   return const ConnectionButtonShimmer();
        // }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  text: _getButtonText(state.userConnectionStatus.status),
                  onPressed: () {
                    if (state.userConnectionStatus.status ==
                        ConnectionInvitationStatus.accepted) {
                      context.pushNamed(
                        ChatMessagesPage.name,
                        pathParameters: {'recipientId': widget.userId},
                      );
                    } else if (state.userConnectionStatus.status ==
                            ConnectionInvitationStatus.rejected ||
                        state.userConnectionStatus.status ==
                            ConnectionInvitationStatus.none) {
                      _sendConnectionReq();
                    }
                  },
                  borderColor: LegalReferralColors.borderBlue,
                  borderWidth: 1.8,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomOutlinedButton(
                  text: 'Refer',
                  onPressed: () => context.pushNamed(CreateReferralPage.name),
                  borderColor: LegalReferralColors.borderBlue,
                  borderWidth: 1.8,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getButtonText(ConnectionInvitationStatus status) {
    switch (status) {
      case ConnectionInvitationStatus.accepted:
        return 'Message';
      case ConnectionInvitationStatus.pending:
        return 'Pending';
      case ConnectionInvitationStatus.rejected:
        return 'Connect';
      default:
        return 'Connect';
    }
  }

  void _sendConnectionReq() {
    final currentUserId = _authBloc.state.user?.userId;
    if (currentUserId != null && currentUserId != widget.userId) {
      _networkBloc.add(
        ConnectionRequestSent(
          sendConnectionReq: SendConnectionReq(
            senderId: currentUserId,
            recipientId: widget.userId,
          ),
        ),
      );
    }
  }
}
