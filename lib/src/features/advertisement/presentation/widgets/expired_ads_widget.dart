import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/presentation.dart';

class ExpiredAdsWidget extends StatefulWidget {
  const ExpiredAdsWidget({super.key});

  @override
  State<ExpiredAdsWidget> createState() => _ExpiredAdsWidgetState();
}

class _ExpiredAdsWidgetState extends State<ExpiredAdsWidget> {
  final _adBloc = getIt<AdBloc>();

  @override
  void initState() {
    _adBloc.add(const ExpiredAdsFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<AdBloc, AdState>(
      bloc: _adBloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Your Ads',
                style: textTheme.headlineMedium,
              ),
            ),
            const Gap(height: 12),
            if (state.status == AdStatus.loading)
              const AdTileShimmer()
            else
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final ad = state.expiredAds[index];
                  return AdTile(
                    buttonText: 'Renew Ad',
                    ad: ad,
                    onTap: () {},
                    isPlaying: false,
                  );
                },
                itemCount: state.expiredAds.length,
              ),
          ],
        );
      },
    );
  }
}
