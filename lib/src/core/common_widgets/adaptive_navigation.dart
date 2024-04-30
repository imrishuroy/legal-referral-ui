import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/config/nav_items.dart';

class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
    required this.child,
    // required this.onSelectedIconColor,
    super.key,
  });
  final List<NavItem> destinations;
  final int selectedIndex;

  final Function(int) onSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            indicatorColor: Colors.transparent,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 12,
            destinations: destinations.map((item) {
              return NavigationDestination(
                icon: item.icon,
                label: item.label,
              );
            }).toList(),
            selectedIndex: selectedIndex,
            onDestinationSelected: onSelected,
          ),
          body: child,
        );
      },
    );
  }
}
