import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/elevatedButton_widget.dart';
import '../../widgets/textfield_widget.dart';
import 'guru_signup_screen2.dart';

class GuruSignupScreen extends StatelessWidget {
  GuruSignupScreen({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController licenseNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
                    //Gap(100),
                    // TextWidget(
                    //     size: 25,
                    //     text: 'Do not have an account',
                    //     fontWeight: FontWeight.w500,
                    //     color: Colors.black),
                    // TextWidget(
                    //     size: 15,
                    //     text: 'Sign up here',
                    //     fontWeight: FontWeight.normal,
                    //     color: Colors.black),
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

                    TextWidget(
                        size: 26,
                        text: 'Hi Guru!',
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    TextWidget(
                        size: 14,
                        text: 'Enter details to continue',
                        fontWeight: FontWeight.normal,
                        color: Colors.black),

                    Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      icon: Icon(Icons.location_on_sharp),
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'License Number',
                      controller: licenseNoController,
                      icon: Icon(Icons.local_police_outlined),
                    ),

                    // DropdownTextFieldWidget(
                    //   labelText: '',
                    //   items: ['Apartment', 'Home', 'Office', 'Commercial'],
                    // ),

                    Gap(5),
                    ElevatedButtonWidget(
                      onPressed: () {
                        if (firstNameController.text.isEmpty ||
                            lastNameController.text.isEmpty ||
                            phoneNumberController.text.isEmpty ||
                            confirmpasswordController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            licenseNoController.text.isEmpty ||
                            addressController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Please fill in all fields'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          // Displaying the Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text('Moving to next screen'),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          // Navigating to the LoginScreen after a delay
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GuruSignupScreen2(),
                              ),
                            );
                          });
                        }
                      },
                      text: 'Next',
                    ),

                    Gap(5),
                    Center(
                      child: TextWidget(
                          size: 12,
                          text: 'Click on next button to complete signup ',
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
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
