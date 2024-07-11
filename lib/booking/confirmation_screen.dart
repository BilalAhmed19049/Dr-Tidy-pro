import 'package:cleaning_app/screens/customer/customer_homescreen.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/done_prev_ui.png',
                height: 100,
              ),
              TextWidget(
                  size: 19,
                  text: 'Your order successfully placed',
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              Gap(50),
              ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomerHomepage()));
                  },
                  text: 'OK')
            ],
          ),
        ),
      ),
    );
  }
}
