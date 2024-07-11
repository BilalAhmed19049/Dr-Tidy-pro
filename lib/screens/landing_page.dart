import 'package:cleaning_app/screens/login_screen.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/elevatedButton_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'assets/26921566_Cleaning team with brooms and vacuum cleaner.jpg',
              ),
              TextWidget(
                  size: 20,
                  text: "Let's Get Started",
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              Gap(30),
              ElevatedButtonWidget(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen(
                                userType: 'customer',
                                ctx: context,
                              )));
                },
                text: 'Continue as TidyLover (Customer)',
              ),
              Gap(10),
              ElevatedButtonWidget(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen(
                                userType: 'cleaner',
                                ctx: context,
                              )));
                },
                text: 'Continue as TidyGuru (Cleaner)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
