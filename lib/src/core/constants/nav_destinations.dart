import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/config/nav_items.dart';
import 'package:legal_referral_ui/src/core/constants/image_string_constants.dart';
import 'package:legal_referral_ui/src/features/network/presentation/pages/network_page.dart';

List<NavItem> destinations = [
  NavItem(
    route: 'HomePage.name',
    label: 'Home',
    icon: SvgPicture.asset(
      ImageStringConstants.home,
    ),
  ),
  NavItem(
    route: 'ReferralPage.name',
    label: 'Referrals',
    icon: SvgPicture.asset(
      ImageStringConstants.referral,
    ),
  ),
  NavItem(
    route: 'PostPage.name',
    label: 'Post',
    icon: SvgPicture.asset(
      ImageStringConstants.addIcon,
    ),
  ),
  NavItem(
    route: NetworkPage.name,
    label: 'Network',
    icon: SvgPicture.asset(
      ImageStringConstants.network,
    ),
  ),
  NavItem(
    route: 'DiscussPage.name',
    label: 'Discuss',
    icon: SvgPicture.asset(
      ImageStringConstants.discuss,
    ),
  ),
];
