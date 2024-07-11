import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.labelText,
      //  required this.fillColor,
      // required this.textColor,
      //required this.hintText,
      this.icon,
      required this.controller});

  final String labelText;

  //  Color fillColor;
  //  Color textColor;
  // final String hintText;
  bool isObscure = false;
  final TextEditingController controller;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        isDense: true,
        // filled: true,
        //contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        labelText: labelText,
      ),
    );
  }
}
