import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:switcher_button/switcher_button.dart';

import '../booking/confirmation_screen.dart';

class CardDetailsScreen2 extends StatelessWidget {
  CardDetailsScreen2({super.key});

  TextEditingController nameController = TextEditingController();

  TextEditingController cardNumber = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Add Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                    child: Image.asset(
                  'assets/card.png',
                  fit: BoxFit.cover,
                )),
              ),
              TextFieldWidget(
                  labelText: 'Card Holder Name', controller: nameController),
              Gap(5),
              TextFieldWidget(
                  labelText: 'Bank Name', controller: bankNameController),
              Gap(5),
              TextFieldWidget(
                  labelText: 'Account no', controller: accountNoController),
              Gap(5),
              TextFieldWidget(labelText: 'Card Number', controller: cardNumber),
              Gap(5),
              Row(
                children: [
                  Expanded(
                      child: TextFieldWidget(
                          labelText: 'Exp date', controller: expiryController)),
                  Gap(5),
                  Expanded(
                      child: TextFieldWidget(
                          labelText: 'CVV', controller: cvvController)),
                ],
              ),
              Gap(20),
              Row(
                children: [
                  SwitcherButton(
                    value: false,
                    offColor: Colors.grey.shade300,
                    onColor: Colors.blue.shade400,
                    onChange: (value) {
                      print(value);
                    },
                  ),
                  Gap(5),
                  Text('Save Card'),
                ],
              ),
              Gap(20),
              ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmationScreen()));
                  },
                  text: 'Add Card And Place'),
            ],
          ),
        ),
      ),
    );
  }
}
