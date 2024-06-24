import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class UserConnectionsPage extends StatefulWidget {
  const UserConnectionsPage({
    required this.chatBloc,
    super.key,
  });

  final ChatBloc chatBloc;

  static const String name = 'UserConnectionsPage';

  @override
  State<UserConnectionsPage> createState() => _UserConnectionsPageState();
}

class _UserConnectionsPageState extends State<UserConnectionsPage> {
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    if (_authBloc.state.user?.userId != null) {
      widget.chatBloc.add(
        ConnectionFetched(
          offset: 1,
          limit: 10,
          userId: _authBloc.state.user!.userId!,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connections'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatBloc, ChatState>(
              bloc: widget.chatBloc,
              listener: (context, state) {
                if (state.status == ChatStatus.failure) {
                  ToastUtil.showToast(
                    context,
                    title: 'Error',
                    description:
                        state.failure?.message ?? 'Something went wrong',
                    type: ToastificationType.error,
                  );
                }
              },
              builder: (context, state) {
                if (state.status == ChatStatus.loading) {
                  return const CustomLoadingIndicator();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListView.builder(
                    itemCount: state.connections.length,
                    itemBuilder: (context, index) {
                      final connection = state.connections[index];
                      return ListTile(
                        title: Text(
                          '${connection?.firstName ?? ''} '
                          '${connection?.lastName ?? ''}',
                        ),
                        subtitle: Text(connection?.about ?? 'N/A'),
                        leading: CustomAvatar(
                          imageUrl: connection?.avatarUrl,
                          radius: 24.r,
                        ),
                        onTap: () {
                          final userId = _authBloc.state.user?.userId;
                          final senderId = connection?.senderId;
                          final recipientId = connection?.recipientId;

                          if (userId == null ||
                              senderId == null ||
                              recipientId == null) {
                            return;
                          }

                          context.pushNamed(
                            ChatMessagesPage.name,
                            pathParameters: {
                              'recipientId':
                                  userId != senderId ? senderId : recipientId,
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
