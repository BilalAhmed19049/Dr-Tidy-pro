import 'package:cleaning_app/screens/resetpassword/reset_password.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

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
                text: 'Forget Password',
                fontWeight: FontWeight.bold,
                color: Colors.black),
            TextWidget(
                size: 14,
                text:
                    'Select which contact details should we use to reset your password',
                fontWeight: FontWeight.normal,
                color: Colors.black),
            Gap(50),
            const RecoveryMethod(
              text: 'Email',
              text2: '**********@gmail.com',
              icon: Icon(Icons.email_outlined),
            ),
            Gap(30),
            const RecoveryMethod(
              text: 'Phone Number',
              text2: '+92**********280',
              icon: Icon(Icons.phone),
            ),
            Spacer(),
            ElevatedButtonWidget(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ResetPassword()));
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
    return Row(
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
    );
  }
}
