import 'package:cleaning_app/screens/customer/signup_screen2.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/elevatedButton_widget.dart';
import '../../widgets/textfield_widget.dart';
import '../login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController AreaController = TextEditingController();

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
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            //border: Border.all(color: Colors.blue, width: 2),
                            image: DecorationImage(
                          image: AssetImage('assets/logoimage.png'),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    Gap(5),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                            labelText: 'First name',
                            controller: firstNameController,
                          ),
                        ),
                        Gap(5),
                        Expanded(
                          child: TextFieldWidget(
                            labelText: 'Last name',
                            controller: lastNameController,
                          ),
                        ),
                      ],
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'Phone Number',
                      controller: phoneNumberController,
                      icon: Icon(Icons.phone),
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'Email',
                      controller: emailController,
                      icon: Icon(Icons.email_outlined),
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'Password',
                      controller: passwordController,
                      icon: Icon(Icons.lock),
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'Confirm Password',
                      controller: confirmpasswordController,
                      icon: Icon(Icons.lock),
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'Address',
                      controller: addressController,
                      icon: Icon(Icons.lock),
                    ),
                    Gap(10),
                    ElevatedButtonWidget(
                      onPressed: () {
                        // Validate text fields
                        if (firstNameController.text.isEmpty ||
                            lastNameController.text.isEmpty ||
                            phoneNumberController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmpasswordController.text.isEmpty ||
                            addressController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Please fill in all fields'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen2()),
                          );
                        }
                      },
                      text: 'Next',
                    ),
                    Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                            size: 12,
                            text: 'Already have an account? ',
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                        TextButton(
                          onPressed: () {
                            // Navigate to LoginScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        userType: 'customer',
                                        ctx: context,
                                      )),
                            );
                          },
                          child: Text('Sign in'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
