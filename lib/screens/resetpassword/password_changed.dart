import 'package:cleaning_app/screens/login_screen.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PasswordChanged extends StatelessWidget {
  PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginScreen(
                          userType: '',
                          ctx: context,
                        )));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/passwordchanged.jpg'),
            TextWidget(
                size: 26,
                text: 'Password Changed',
                fontWeight: FontWeight.bold,
                color: Colors.black),
            TextWidget(
                size: 13,
                text: 'Your password has been changed successfully',
                fontWeight: FontWeight.normal,
                color: Colors.black),
            Spacer(),
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
              text: 'Sign in',
            )
          ],
        ),
      ),
    );
  }
}
