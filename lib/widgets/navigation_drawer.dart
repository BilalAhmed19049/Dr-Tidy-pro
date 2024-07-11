import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                size: 16,
                text: 'Welcome to menu screen',
                fontWeight: FontWeight.normal,
                color: Colors.white),
            Gap(20),
            TextWidget(
                size: 16,
                text: 'Home',
                fontWeight: FontWeight.normal,
                color: Colors.white),
            Gap(20),
            TextWidget(
                size: 16,
                text: 'Settings',
                fontWeight: FontWeight.normal,
                color: Colors.white),
            Gap(20),
            TextWidget(
                size: 16,
                text: 'Logout',
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ],
        ),
      ),
    );
  }
}
