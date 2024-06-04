import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_tile.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/home/presentation/widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String name = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authBloc = getIt<AuthBloc>();
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
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
              onPressed: () {},
              imagePath: IconStringConstants.bell,
              width: 24.w,
              height: 24.h,
            ),
          ],
        ),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: GestureDetector(
            onTap: () => context.pushNamed(
              ProfilePage.name,
              pathParameters: {
                'userId': _authBloc.state.user?.userId ?? '',
              },
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                _authBloc.state.user?.avatarUrl ?? '',
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 16.w, right: 8.w),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => VerticalTile(
                    onPressed: () {},
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: LegalReferralColors.borderGrey300,
                          width: 1.w,
                        ),
                      ),
                      child: CustomAvatar(
                        imageUrl: null,
                        radius: 36.r,
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          'First Name',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    height: 1.2,
                                  ),
                        ),
                        // Text(
                        //   'Last Name',
                        //   textAlign: TextAlign.center,
                        //   style:
                        //       Theme.of(context).textTheme.bodyLarge?
                        // .copyWith(
                        //             height: 0.8,
                        //           ),
                        // ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: 10,
                ),
              ),
              const PostStructure(
                attorneyName: 'Attorney Name',
                attorneyType: 'Attorney Type',
                postedTime: '13 mins ago',
                child: MultiplePost(),
              ),
              const SizedBox(
                height: 8,
              ),
              const PostStructure(
                attorneyName: 'Attorney Name',
                attorneyType: 'Attorney Type',
                postedTime: '13 mins ago',
                child: SinglePost(),
              ),
              const SizedBox(
                height: 8,
              ),
              const PostStructure(
                attorneyName: 'Attorney Name',
                attorneyType: 'Attorney Type',
                postedTime: '13 mins ago',
                child: NormalPost(),
              ),
              const SizedBox(
                height: 8,
              ),
              const PostStructure(
                attorneyName: 'Attorney Name',
                attorneyType: 'Attorney Type',
                postedTime: '13 mins ago',
                child: LinkPost(),
              ),
              const SizedBox(
                height: 8,
              ),
              const PostStructure(
                attorneyName: 'Attorney Name',
                attorneyType: 'Attorney Type',
                postedTime: '13 mins ago',
                child: PollPost(),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
      // Center(
      //   child: TextButton(
      //     onPressed: () => LogoutManager.performLogout(),
      //     child: const Text('Sign Out'),
      //   ),
      // ),
    );
  }
}
