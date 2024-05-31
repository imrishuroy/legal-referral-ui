import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/pages/chat_rooms_page.dart';
import 'package:legal_referral_ui/src/features/network/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/search/presentation/presentation.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});
  static const String name = 'NetworkPage';

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  final TextEditingController _searchController = TextEditingController();

  final _networkBloc = getIt<NetworkBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => context.pushNamed(
                  SearchPage.name,
                ),
                child: CustomTextField(
                  controller: _searchController,
                  hintText: 'Search',
                  labelText: '',
                  showLabel: false,
                  borderColor: LegalReferralColors.borderGrey199,
                  fillColor: LegalReferralColors.containerWhite400,
                  enabled: false,
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            SvgButton(
              onPressed: () => context.pushNamed(ChatRoomsPage.name),
              imagePath: IconStringConstants.comment,
              width: 24.w,
              height: 24.h,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Invites',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  CustomTextButton(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    text: 'View All',
                    onPressed: () => context.pushNamed(
                      InvitesPage.name,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              InvitesSection(
                networkBloc: _networkBloc,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    'Recommendation',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  CustomTextButton(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    text: 'View All',
                    onPressed: () => context.pushNamed(
                      RecommendationPage.name,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              RecommendationsSection(
                networkBloc: _networkBloc,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    'Connection',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  CustomTextButton(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    text: 'View All',
                    onPressed: () => context.pushNamed(
                      ConnectionPage.name,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              ConnectionsSection(
                networkBloc: _networkBloc,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
