import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class MyLawFirmPage extends StatefulWidget {
  const MyLawFirmPage({
    super.key,
  });

  static const String name = 'MyLawFirmPage';

  @override
  State<MyLawFirmPage> createState() => _MyLawFirmPageState();
}

class _MyLawFirmPageState extends State<MyLawFirmPage> {
  final _authBloc = getIt<AuthBloc>();
  final _firmBloc = getIt<FirmBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _firmBloc.add(MyFirmsFetched(ownerId: userId));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Law Firm'),
      ),
      body: BlocConsumer<FirmBloc, FirmState>(
        bloc: _firmBloc,
        listener: (context, state) {
          if (state.status == FirmStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.status == FirmStatus.loading) {
            return const CustomLoadingIndicator();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.myFirms.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.myFirms.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.myFirms.length) {
                        return Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              iconColor: Colors.blue,
                            ),
                            onPressed: () => context.pushNamed(
                              AddEditLawFirmPage.name,
                              extra: AddEditLawFirmPageArgs(
                                firmBloc: _firmBloc,
                              ),
                            ),
                            icon: const Icon(Icons.add),
                            label: const Text(
                              'Create a Firm Page',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        );
                      }
                      final firm = state.myFirms[index];
                      return Card(
                        elevation: 2,
                        shadowColor: Colors.grey.shade200,
                        child: ListTile(
                          leading: CustomAvatar(
                            imageUrl: firm.logoUrl,
                          ),
                          title: Text(
                            firm.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // trailing: SvgButton(
                          //   imagePath: IconStringConstants.editIcon,
                          //   height: 18,
                          //   width: 18,
                          //   color: Colors.blue,
                          //   onPressed: () => context.pushNamed(
                          //     AddEditLawFirmPage.name,
                          //     extra: AddEditLawFirmPageArgs(
                          //       firmBloc: _firmBloc,
                          //       firm: firm,
                          //     ),
                          //   ),
                          // ),
                          onTap: () => context.pushNamed(
                            FirmPage.name,
                            extra: firm,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
