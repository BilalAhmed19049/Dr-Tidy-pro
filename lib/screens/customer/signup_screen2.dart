import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/dropdown_field.dart';
import '../../widgets/elevatedButton_widget.dart';
import '../../widgets/textfield_widget.dart';
import '../login_screen.dart';

class SignupScreen2 extends StatelessWidget {
  SignupScreen2({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController nriccontroller = TextEditingController();
  TextEditingController washroomController = TextEditingController();

  String? selectedHouseType;
  String? selectedAreaUnit;

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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    DropdownTextFieldWidget(
                      labelText: 'Type of House',
                      items: [
                        'Apartment',
                        'Office',
                        'Flat',
                        'Bunglow',
                        'Terrace'
                      ],
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'Floor',
                      controller: floorController,
                      icon: Icon(Icons.apartment),
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'No of Rooms',
                      controller: roomController,
                      icon: Icon(Icons.meeting_room),
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'No of Washrooms',
                      controller: washroomController,
                      icon: Icon(Icons.bathroom),
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'Area in Sq ft ',
                      controller: areaController,
                      icon: Icon(Icons.location_history),
                    ),
                    Gap(5),
                    TextFieldWidget(
                      labelText: 'NRIC No ',
                      controller: nriccontroller,
                      icon: Icon(Icons.numbers),
                    ),
                    Gap(5),
                    ElevatedButtonWidget(
                      onPressed: () {
                        if (floorController.text.isEmpty ||
                            roomController.text.isEmpty ||
                            washroomController.text.isEmpty ||
                            areaController.text.isEmpty ||
                            nriccontroller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Please fill in all fields'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          // Displaying the progress indicator
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            // prevent user from dismissing dialog
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      LinearProgressIndicator(),
                                      SizedBox(height: 20),
                                      Text("Creating account..."),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          // Navigating to the LoginScreen after a delay
                          Future.delayed(Duration(seconds: 3), () {
                            Navigator.pop(context); // close the dialog
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                    'Account Created Successfully, Now Login'),
                              ),
                            );

                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                    userType: 'customer',
                                    ctx: context,
                                  ),
                                ),
                              );
                            });
                          });
                        }
                      },
                      text: 'Signup',
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
                    ),
                    TextWidget(
                        size: 12,
                        text:
                            'By signing up or loging in, I accept the Dr.Tidy',
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    TextWidget(
                        size: 12,
                        text: ' Pro Terms of Service and Privacy Policy',
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
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
