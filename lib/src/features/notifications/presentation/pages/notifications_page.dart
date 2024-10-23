import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/injection_container.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/notifications/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  static const name = 'NotificationsPage';

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _authBloc = getIt<AuthBloc>();
  final _notificationsBloc = getIt<NotificationsBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _fetchNotifications();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: BlocConsumer<NotificationsBloc, NotificationsState>(
        bloc: _notificationsBloc,
        listener: (context, state) {
          if (state.status == NotificationsStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.success,
            );
          }
        },
        builder: (context, state) {
          if (state.status == NotificationsStatus.loading) {
            return const NotificationsShimmer();
          }
          final notifications = state.notifications;
          if (notifications.isEmpty) {
            return const Center(child: Text('No notifications'));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: _scrollController,
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = state.notifications[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: CustomAvatar(
                            radius: 22,
                            imageUrl: notification.senderAvatarUrl,
                          ),
                          title: Text(notification.message),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _fetchNotifications() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _notificationsBloc.add(NotificationsFetched(userId: userId));
    }
  }

  void _onScroll() {
    if (_isBottom) {
      _fetchNotifications();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
