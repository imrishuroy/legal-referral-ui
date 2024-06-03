import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ConnectionsSection extends StatefulWidget {
  const ConnectionsSection({required this.networkBloc, super.key});

  final NetworkBloc networkBloc;

  @override
  State<ConnectionsSection> createState() => _ConnectionsSectionState();
}

class _ConnectionsSectionState extends State<ConnectionsSection> {
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;

    if (userId != null) {
      widget.networkBloc.add(
        ConnectionsFetched(
          userId: userId,
          offset: 1,
          limit: 6,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      bloc: widget.networkBloc,
      builder: (context, state) {
        if (state.connectionStatus == ConnectionStatus.loading) {
          return const ConnectionsShimmer(
            itemCount: 6,
          );
        }

        if (state.connectionStatus == ConnectionStatus.success) {
          return Container(
            decoration: BoxDecoration(
              color: LegalReferralColors.containerWhite500,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.connections.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  final currentUserId = _authBloc.state.user?.userId;
                  final senderId = state.connections[index]?.senderId;
                  final receiverId = state.connections[index]?.recipientId;

                  final userId =
                      currentUserId == senderId ? receiverId : senderId;

                  if (userId != null) {
                    context.pushNamed(
                      ProfilePage.name,
                      pathParameters: {'userId': userId},
                    );
                  }
                },
                child: ConnectionTile(
                  connection: state.connections[index],
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                height: 2.h,
                color: LegalReferralColors.borderGrey100,
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
