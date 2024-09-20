import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/account/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  static const String name = 'FAQPage';

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final _accountBloc = getIt<AccountBloc>();

  @override
  void initState() {
    _accountBloc.add(FAQFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Frequently Asked Question',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: BlocConsumer<AccountBloc, AccountState>(
        bloc: _accountBloc,
        listener: (context, state) {
          if (state.status == AccountStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.status == AccountStatus.loading) {
            return const FAQShimmer();
          }
          final faqs = state.faqs;
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            itemCount: faqs.length,
            itemBuilder: (context, index) {
              final faq = faqs[index];
              return ExpansionTile(
                iconColor: LegalReferralColors.borderGrey400,
                collapsedIconColor: LegalReferralColors.borderGrey400,
                tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
                shape: const Border(),
                collapsedBackgroundColor:
                    LegalReferralColors.backgroundWhite255,
                backgroundColor: LegalReferralColors.backgroundWhite255,
                expandedAlignment: Alignment.centerLeft,
                title: Text(
                  faq.question,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Text(
                      faq.answer,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: LegalReferralColors.textGrey500),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 0,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          );
        },
      ),
    );
  }
}
