import 'package:cleaning_app/screens/cleaner/guru_homescreen.dart';
import 'package:cleaning_app/screens/cleaner/guru_signup_screen.dart';
import 'package:cleaning_app/screens/customer/signup_screen.dart';
import 'package:cleaning_app/screens/resetpassword/forget_password.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/elevatedButton_widget.dart';
import '../widgets/textfield_widget.dart';
import 'customer/customer_homescreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.userType, required this.ctx});

  final String userType;
  final BuildContext ctx;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    size: 26,
                    text: 'Welcome Back',
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                Gap(10),
                TextFieldWidget(
                  labelText: 'Email',
                  controller: emailController,
                  icon: Icon(Icons.email_outlined),
                ),
                Gap(10),
                TextFieldWidget(
                  labelText: 'Password',
                  controller: passwordController,
                  icon: Icon(Icons.lock),
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPassword()));
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.red.shade400),
                        )),
                  ],
                ),
                ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => userType == 'customer'
                            ? CustomerHomepage()
                            : GuruHomescreen(),
                      ),
                    );
                  },
                  text: 'Login'
                      '',
                ),
                Gap(10),
                Center(
                    child: TextWidget(
                        size: 16,
                        text: 'Or continue using ',
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(10),
                    SizedBox(
                      width: 50, // Set the width for the icon
                      height: 50, // Set the height for the icon
                      child: IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          // Handle Facebook sign in
                        },
                      ),
                    ),
                    Gap(20),
                    SizedBox(
                      width: 50, // Set the width for the icon
                      height: 50, // Set the height for the icon
                      child: IconButton(
                        icon: Icon(Icons.email_outlined),
                        onPressed: () {
                          // Handle Facebook sign in
                        },
                      ),
                    ),
                    Gap(20),
                    SizedBox(
                      width: 50, // Set the width for the icon
                      height: 50, // Set the height for the icon
                      child: IconButton(
                        icon: Image.asset('assets/google.png'),
                        onPressed: () {
                          // Handle Google sign in
                        },
                      ),
                    ),
                    Gap(20),
                    SizedBox(
                      width: 50, // Set the width for the icon
                      height: 50, // Set the height for the icon
                      child: IconButton(
                        icon: Image.asset('assets/fb.png'),
                        onPressed: () {
                          // Handle Facebook sign in
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                        size: 12,
                        text: 'Do not have an account?',
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => userType == 'customer'
                                      ? SignupScreen()
                                      : GuruSignupScreen()));
                        },
                        child: Text('Sign up')),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
