import 'package:cleaning_app/screens/customer/subscription_screen.dart';
import 'package:cleaning_app/screens/login_screen.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'card_details_scren.dart';
import 'customer/contactus_screen.dart';
import 'customer/user_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: ClipOval(
                        child: Image.asset(
                  'assets/822.jpg',
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ))),
              ),
              TextWidget(
                  size: 14,
                  text: 'Thiru Maaran',
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              Gap(20),
              ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomerDetailsScreen()));
                  },
                  text: 'Profile'),
              Gap(10),
              ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailsScreen()));
                  },
                  text: 'Payments Options'),
              Gap(10),
              ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubscriptionScreen()));
                  },
                  text: 'Subscriptions'),
              Gap(10),
              ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactUsScreen()));
                  },
                  text: 'Contact Us'),
              Gap(10),
              ElevatedButtonWidget(onPressed: () {}, text: 'FAQ'),
              Gap(10),
              ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen(
                                  userType: '',
                                  ctx: context,
                                )));
                  },
                  text: 'Logout'),
            ],
          ),
        ),
      ),
    );
  }
}
