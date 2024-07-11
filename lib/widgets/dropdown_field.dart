import 'package:flutter/material.dart';

class DropdownTextFieldWidget extends StatefulWidget {
  const DropdownTextFieldWidget({
    Key? key,
    required this.labelText,
    required this.items,
    // required this.controller,
  }) : super(key: key);

  final String labelText;
  final List<String> items;

  // final TextEditingController controller;

  @override
  _DropdownTextFieldWidgetState createState() =>
      _DropdownTextFieldWidgetState();
}

class _DropdownTextFieldWidgetState extends State<DropdownTextFieldWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
          // widget.controller.text = newValue!;
        });
      },
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        labelText: widget.labelText,
      ),
    );
  }
}
