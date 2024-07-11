import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onTabChange,
  });

  final Function(int) onTabChange;

  @override
  Widget build(BuildContext context) {
    return GNav(
      rippleColor: Colors.blue.shade800,
      color: Colors.blue,
      haptic: true,
      activeColor: Colors.blue,
      tabBackgroundColor: Colors.blue.shade100,
      tabBorderRadius: 40,
      tabActiveBorder: Border.all(color: Colors.black, width: 1),
      curve: Curves.easeOutExpo,
      gap: 5,
      onTabChange: onTabChange,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.local_offer_outlined,
          text: 'Subscription',
        ),
        GButton(
          icon: Icons.check_circle_outline,
          text: 'Booked',
        ),
        GButton(
          icon: Icons.settings,
          text: 'Settings',
        ),
      ],
    );
  }
}
