import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  static const String name = 'ConnectionPage';

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final TextEditingController _searchController = TextEditingController();
  final _authBloc = getIt<AuthBloc>();
  final _networkBloc = getIt<NetworkBloc>();
  List<String> filterList = [
    'All',
    '1st',
    '2nd',
  ];

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _networkBloc.add(
        ConnectionsFetched(
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          100.h,
        ),
        child: AppBar(
          title: Text(
            'Connections',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              60.h,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 16.h,
              ),
              child: SizedBox(
                height: 35.h,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: filterList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: CustomOutlinedButton(
                          text: filterList[index],
                          borderColor: LegalReferralColors.borderGrey400,
                          textColor: LegalReferralColors.textGrey400,
                          onPressed: () {},
                          width: 55.w,
                          borderRadius: 64.r,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: CustomTextField(
                      controller: _searchController,
                      hintText: 'search',
                      labelText: '',
                      showLabel: false,
                      borderColor: LegalReferralColors.borderGrey199,
                      fillColor: LegalReferralColors.containerWhite400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                // GestureDetector(
                //   onTap: () => context.pushNamed(
                //     ConnectionFilterPage.name,
                //   ),
                //   child: SvgPicture.asset(
                //     IconStringConstants.filter,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: BlocConsumer<NetworkBloc, NetworkState>(
                bloc: _networkBloc,
                listener: (context, state) {
                  if (state.status == NetworkStatus.failure) {
                    ToastUtil.showToast(
                      context,
                      title: 'Error',
                      description:
                          state.failure?.message ?? 'something went wrong',
                      type: ToastificationType.error,
                    );
                  }
                },
                builder: (context, state) {
                  if (state.status == NetworkStatus.loading) {
                    return const InviteShimmer(itemCount: 10);
                  }
                  if (state.connections.isEmpty) {
                    return Center(
                      child: Text(
                        'No Connections',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.connections.length} CONNECTIONS',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: LegalReferralColors.textGrey500,
                            ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: LegalReferralColors.containerWhite500,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: ListView.separated(
                            itemCount: state.connections.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  final currentUserId =
                                      _authBloc.state.user?.userId;
                                  final senderId =
                                      state.connections[index]?.senderId;
                                  final receiverId =
                                      state.connections[index]?.recipientId;

                                  final userId = currentUserId == senderId
                                      ? receiverId
                                      : senderId;

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
                              );
                            },
                            separatorBuilder: (context, index) => Divider(
                              height: 2.h,
                              color: LegalReferralColors.borderGrey100,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
