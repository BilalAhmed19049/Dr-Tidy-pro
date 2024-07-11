import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:cleaning_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();

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
                text: 'Verification Code',
                fontWeight: FontWeight.bold,
                color: Colors.black),
            TextWidget(
                size: 14,
                text:
                    'Enter the verification code that we have sent to your email or Phone Number',
                fontWeight: FontWeight.normal,
                color: Colors.black),
            Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TextFieldWidget(
                        labelText: '', controller: otpController1)),
                Gap(10),
                Expanded(
                    child: TextFieldWidget(
                        labelText: '', controller: otpController2)),
                Gap(10),
                Expanded(
                    child: TextFieldWidget(
                        labelText: '', controller: otpController3)),
                Gap(10),
                Expanded(
                    child: TextFieldWidget(
                        labelText: '', controller: otpController4)),
              ],
            ),
            Center(
                child:
                    TextButton(onPressed: () {}, child: Text('Resend Code'))),
            Spacer(),
            ElevatedButtonWidget(
              onPressed: () {},
              text: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}
