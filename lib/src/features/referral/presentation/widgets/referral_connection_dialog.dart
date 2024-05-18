import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ReferralConnectionsDialoag extends StatefulWidget {
  const ReferralConnectionsDialoag({
    required this.addReferralReq,
    super.key,
  });

  final AddReferralReq addReferralReq;

  @override
  State<ReferralConnectionsDialoag> createState() =>
      _ReferralConnectionsDialoagState();
}

class _ReferralConnectionsDialoagState
    extends State<ReferralConnectionsDialoag> {
  final _authBloc = getIt<AuthBloc>();
  final _refferralBloc = getIt<ReferralBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;

    if (userId != null) {
      _refferralBloc.add(
        ConnectionsFetched(
          userId: userId,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocConsumer<ReferralBloc, ReferralState>(
      bloc: _refferralBloc,
      listener: (context, state) {
        if (state.status == ReferralStatus.referralAdded) {
          ToastUtil.showToast(
            context,
            title: 'Success',
            description: 'Referral posted successfully',
            type: ToastificationType.success,
          );
          context.pop();
          context.pushReplacementNamed(
            ReferralPage.name,
          );
        } else if (state.status == ReferralStatus.failure) {
          ToastUtil.showToast(
            context,
            title: 'Error',
            description: state.failure?.message ?? 'something went wrong',
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        if (state.status == ReferralStatus.loading) {
          return const CustomLoadingIndicator();
        }

        final connections = state.connections;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  'Select Attorneys to Send Referral',
                  style: textTheme.headlineSmall,
                ),
                const Spacer(),
                CustomIconButton(
                  onTap: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            CheckboxListTile(
              value: state.selectedConnections.length == connections.length,
              checkColor: LegalReferralColors.textBlack,
              fillColor: MaterialStateProperty.all(Colors.transparent),
              onChanged: (value) {
                if (value == true) {
                  _refferralBloc.add(
                    AllConnectionsSelected(),
                  );
                }
              },
              title: Text(
                'Select all',
                style: textTheme.bodyLarge,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            SizedBox(height: 4.h),
            Expanded(
              child: ListView.separated(
                itemCount: connections.length,
                itemBuilder: (context, index) {
                  final connection = connections[index];
                  final isSelected =
                      state.selectedConnections.contains(connection);
                  return GestureDetector(
                    onTap: () {
                      if (connection != null) {
                        _refferralBloc.add(
                          ConnectionSelected(
                            connection: connection,
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: isSelected
                                ? const CircularCheckBox()
                                : CustomAvatar(
                                    imageUrl: connection?.avatarUrl,
                                    radius: 24.r,
                                  ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '${connection?.firstName} ${connection?.lastName}',
                            style: textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomElevatedButton(
              text: 'Post referral',
              onTap: () {
                final selectedConnections = state.selectedConnections;
                if (selectedConnections.isNotEmpty) {
                  final currentUserId = _authBloc.state.user?.userId;

                  final connectionUserIds =
                      selectedConnections.map((connection) {
                    // Check if senderId is equal to currentUserId

                    if (connection?.senderId == currentUserId) {
                      // If so, use recipientId
                      return connection?.recipientId ?? '';
                    } else {
                      // Otherwise, use senderId
                      return connection?.senderId ?? '';
                    }
                  }).toList();

                  final referral = widget.addReferralReq.copyWith(
                    referredUserIds: connectionUserIds,
                  );

                  _refferralBloc.add(
                    ReferralAdded(
                      referral: referral,
                    ),
                  );
                } else {
                  ToastUtil.showToast(
                    context,
                    title: 'Error',
                    description: 'Please select at least one connection',
                    type: ToastificationType.error,
                  );
                }
              },
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        );
      },
    );
  }
}
