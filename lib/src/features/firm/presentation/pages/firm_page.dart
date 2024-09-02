import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/firm/domain/domain.dart';
import 'package:legal_referral_ui/src/features/firm/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class FirmPage extends StatefulWidget {
  const FirmPage({
    required this.firm,
    super.key,
  });

  final Firm firm;

  static const String name = 'FirmPage';

  @override
  State<FirmPage> createState() => _FirmPageState();
}

class _FirmPageState extends State<FirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Firm Details',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              ColoredBox(
                color: LegalReferralColors.containerWhite500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FirmHeaderSection(firm: widget.firm),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.firm.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.firm.orgType,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Text(' • '),
                              Text(
                                widget.firm.website,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: LegalReferralColors.textBlue69,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            widget.firm.location,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ColoredBox(
                color: LegalReferralColors.containerWhite500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        widget.firm.about,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ColoredBox(
                color: LegalReferralColors.containerWhite500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Socials',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const _FirmSocials(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirmHeaderSection extends StatelessWidget {
  const FirmHeaderSection({
    required this.firm,
    super.key,
  });

  final Firm firm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Stack(
        children: [
          // CustomNetworkImage(
          //   imageUrl: firm.logoUrl,
          //   height: 140.h,
          //   width: double.infinity,
          // ),
          Container(
            height: 140.h,
            color: const Color(0xffA7D3F5),
          ),

          Positioned(
            top: 61.h,
            left: 16.w,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: LegalReferralColors.containerWhite500,
                  width: 2.w,
                ),
              ),
              child: CustomAvatar(
                imageUrl: firm.logoUrl,
                radius: 78.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FirmSocials extends StatefulWidget {
  const _FirmSocials();

  @override
  State<_FirmSocials> createState() => _FirmSocialsState();
}

class _FirmSocialsState extends State<_FirmSocials> {
  final _authBloc = getIt<AuthBloc>();
  final _firmBloc = getIt<FirmBloc>();

  @override
  void initState() {
    final userId = _authBloc.state.user?.userId;
    if (userId != null) {
      _firmBloc.add(FirmSocialsFetched(userId: userId));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirmBloc, FirmState>(
      bloc: _firmBloc,
      builder: (context, state) {
        return state.status == FirmStatus.loading
            ? const SocialShimmer()
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: state.socials.length,
                itemBuilder: (context, index) {
                  final social = state.socials[index];
                  return SocialTile(
                    social: social,
                  );
                },
              );
      },
    );
  }
}
