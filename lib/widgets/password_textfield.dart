import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  PasswordTextFieldWidget({
    Key? key,
    required this.labelText,
    this.icon,
    required this.controller,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final Icon? icon;

  @override
  _PasswordTextFieldWidget createState() => _PasswordTextFieldWidget();
}

class _PasswordTextFieldWidget extends State<PasswordTextFieldWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
    );
  }
}
