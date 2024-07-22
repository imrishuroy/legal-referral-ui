import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AdPage extends StatefulWidget {
  const AdPage({super.key});

  static const String name = 'AdPage';

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  final _adBloc = getIt<AdBloc>();

  @override
  void initState() {
    _adBloc.add(const PlayingAdsFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: SvgButton(
              height: 24.h,
              width: 24.w,
              color: LegalReferralColors.borderBlue100,
              imagePath: IconStringConstants.addIcon,
              onPressed: () => context.pushNamed(CreateAdPage.name),
            ),
          ),
        ],
        elevation: 1,
        title: Text(
          'Post an Advertisement',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AdBloc, AdState>(
          bloc: _adBloc,
          listener: (context, state) {
            if (state.status == AdStatus.failure) {
              ToastUtil.showToast(
                context,
                title: 'Error',
                description: state.failure?.message ?? 'something went wrong',
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(height: 16),
                if (state.status == AdStatus.success &&
                    state.playingAds.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Playing Ad',
                      style: textTheme.headlineMedium,
                    ),
                  ),
                const Gap(height: 12),
                if (state.status == AdStatus.loading)
                  const AdTileShimmer()
                else if (state.playingAds.isEmpty)
                  const StartAdWidget()
                else
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.playingAds.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final ad = state.playingAds[index];
                      return AdTile(
                        buttonText: 'Extend Ad period',
                        ad: ad,
                        onTap: () async {
                          final res = await context.pushNamed<bool>(
                            ExtendAdPeriodPage.name,
                            extra: ad,
                          );
                          if (res != null && res) {
                            _adBloc.add(const PlayingAdsFetched());
                          }
                        },
                        isPlaying: true,
                      );
                    },
                  ),
                const Gap(height: 24),
                const ExpiredAdsWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
