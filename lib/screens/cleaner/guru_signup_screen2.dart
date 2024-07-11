import 'dart:io';

import 'package:cleaning_app/screens/cleaner/tutorial_screen.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/elevatedButton_widget.dart';

class GuruSignupScreen2 extends StatefulWidget {
  GuruSignupScreen2({super.key});

  @override
  State<GuruSignupScreen2> createState() => _GuruSignupScreen2State();
}

class _GuruSignupScreen2State extends State<GuruSignupScreen2> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selfieImage;
  XFile? _nricImage;
  XFile? _drivingLicenseImage;

  Future<void> _pickImage(BuildContext context, String imageType) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (imageType == 'selfie') {
          _selfieImage = image;
        } else if (imageType == 'nric') {
          _nricImage = image;
        } else if (imageType == 'drivingLicense') {
          _drivingLicenseImage = image;
        }
      });
    }
  }

  Widget _buildImagePicker(String label, XFile? image, String imageType) {
    return GestureDetector(
      onTap: () => _pickImage(context, imageType),
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 2,
        dashPattern: [6, 3],
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        child: Container(
          height: 150,
          width: double.infinity,
          alignment: Alignment.center,
          child: image == null
              ? Text('Upload $label')
              : Image.file(
                  File(image.path),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

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
                        text: 'Enter remaining details to finish',
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    Gap(10),
                    _buildImagePicker('Selfie', _selfieImage, 'selfie'),
                    Gap(10),
                    _buildImagePicker('NRIC Card', _nricImage, 'nric'),
                    Gap(10),
                    _buildImagePicker('Driving License', _drivingLicenseImage,
                        'drivingLicense'),
                    Gap(10),
                    ElevatedButtonWidget(
                      onPressed: () {
                        if (_selfieImage == null ||
                            _nricImage == null ||
                            _drivingLicenseImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Please upload all required images'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TutorialScreen(),
                            ),
                          );
                        });
                      },
                      text: 'Signup',
                    ),
                    TextWidget(
                        size: 12,
                        text: 'By signing up or loging in, I accept the Dr.',
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    TextWidget(
                        size: 12,
                        text: 'Tidy Pro Terms of Service and Privacy Policy',
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
