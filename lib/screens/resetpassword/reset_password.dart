import 'package:cleaning_app/screens/resetpassword/new_password.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                size: 26,
                text: 'Reset Password',
                fontWeight: FontWeight.bold,
                color: Colors.black),
            TextWidget(
                size: 14,
                text: 'Enter your OTP we have just send to you',
                fontWeight: FontWeight.normal,
                color: Colors.black),
            Gap(50),
            const RecoveryMethod(
              text: 'Phone Number',
              text2: '+92**********280',
              icon: Icon(Icons.phone),
            ),
            Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    maxLength: 1,
                  ),
                );
              }),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                    size: 12,
                    text: "Don't get a code?",
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
                TextButton(onPressed: () {}, child: Text('Send Again')),
              ],
            ),
            Gap(20),
            ElevatedButtonWidget(
              onPressed: () {
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => NewPassword()));
                }
              },
              text: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}

class RecoveryMethod extends StatelessWidget {
  const RecoveryMethod({
    super.key,
    required this.text,
    required this.text2,
    required this.icon,
  });

  final String text;
  final String text2;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(20),
          icon,
          Gap(30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  size: 16,
                  text: text,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              TextWidget(
                size: 12,
                text: text2,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
