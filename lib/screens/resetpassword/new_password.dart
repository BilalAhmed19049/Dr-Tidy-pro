import 'package:cleaning_app/screens/resetpassword/password_changed.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/password_textfield.dart';

class NewPassword extends StatelessWidget {
  NewPassword({super.key});

  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmnewpassword = TextEditingController();

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
                text: 'Create new Password',
                fontWeight: FontWeight.bold,
                color: Colors.black),
            TextWidget(
                size: 14,
                text:
                    'Your password must be different from previous used password',
                fontWeight: FontWeight.normal,
                color: Colors.black),
            Gap(55),
            PasswordTextFieldWidget(
              labelText: 'Old Password',
              controller: oldpassword,
            ),
            Gap(15),
            PasswordTextFieldWidget(
              labelText: 'New Password',
              controller: newpassword,
            ),
            Gap(15),
            PasswordTextFieldWidget(
              labelText: 'Confirm Password',
              controller: confirmnewpassword,
            ),
            Spacer(),
            ElevatedButtonWidget(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PasswordChanged()));
              },
              text: 'Reset Password',
            )
          ],
        ),
      ),
    );
  }
}
