import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/config/nav_items.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/discuss/presentation/pages/discuss_page.dart';
import 'package:legal_referral_ui/src/features/home_page.dart';
import 'package:legal_referral_ui/src/features/network/presentation/pages/network_page.dart';
import 'package:legal_referral_ui/src/features/referral/presentation/presentation.dart';

List<NavItem> destinations = [
  NavItem(
    route: HomePage.name,
    label: 'Home',
    icon: SvgPicture.asset(
      IconStringConstants.home,
    ),
  ),
  NavItem(
    route: ReferralPage.name,
    label: 'Referrals',
    icon: SvgPicture.asset(
      IconStringConstants.referral,
    ),
  ),
  NavItem(
    // route: PostPage.name,
    route: 'bottomSheet',
    label: 'Post',
    icon: SvgPicture.asset(
      IconStringConstants.addIcon,
    ),
  ),
  NavItem(
    route: NetworkPage.name,
    label: 'Network',
    icon: SvgPicture.asset(
      IconStringConstants.network,
    ),
  ),
  NavItem(
    route: DiscussPage.name,
    label: 'Discuss',
    icon: SvgPicture.asset(
      IconStringConstants.discuss,
    ),
  ),
];
