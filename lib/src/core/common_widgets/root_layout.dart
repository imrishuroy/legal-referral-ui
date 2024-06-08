import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/post_bottom_sheet.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class RootLayout extends StatelessWidget {
  const RootLayout({
    required this.currentIndex,
    required this.child,
    super.key,
  });

  final Widget child;
  final int currentIndex;
  static const _switcherKey = ValueKey('switcherKey');
  static const _navigationRailKey = ValueKey('navigationRailKey');

  @override
  Widget build(BuildContext context) {
    void onSelected(int index) {
      final destination = destinations[index];
      if (destination.route == PostModelBottomSheet.name) {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          backgroundColor: LegalReferralColors.backgroundWhite255,
          context: context,
          builder: (context) => const PostModelBottomSheet(),
        );
      } else {
        context.pushNamed(destination.route);
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return AdaptiveNavigation(
          key: _navigationRailKey,
          destinations: destinations,
          selectedIndex: currentIndex,
          onSelected: onSelected,
          child: _Switcher(
            key: _switcherKey,
            child: child,
          ),
        );
      },
    );
  }
}

class _Switcher extends StatelessWidget {
  const _Switcher({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      key: key,
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: child,
    );
  }
}
