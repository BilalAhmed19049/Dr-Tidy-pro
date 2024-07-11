import 'package:cleaning_app/screens/customer/subscription_screen.dart';
import 'package:cleaning_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../booking/booked_screen.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'customerHomeScreen.dart';

class CustomerHomepage extends StatefulWidget {
  CustomerHomepage({super.key});

  @override
  State<CustomerHomepage> createState() => _CustomerHomepageState();
}

class _CustomerHomepageState extends State<CustomerHomepage> {
  final List<Widget> _screens = [
    CstHomeScreen(),
    SubscriptionScreen(),
    const BookedScreen(),
    SettingsScreen(),
  ];
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavBar(onTabChange: _onTabChange),
    );
  }
}
