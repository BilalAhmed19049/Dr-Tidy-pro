import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:flutter/material.dart';

import 'booking_confirmation.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  _PackagesScreenState createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  int _selectedPackage = 1;

  void _handlePackageChange(int? value) {
    setState(() {
      _selectedPackage = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your package'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                'assets/img.png',
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Radio<int>(
                    value: 1,
                    groupValue: _selectedPackage,
                    onChanged: _handlePackageChange,
                  ),
                  Text('Package 1'),
                  SizedBox(width: 20),
                  Radio<int>(
                    value: 2,
                    groupValue: _selectedPackage,
                    onChanged: _handlePackageChange,
                  ),
                  Text('Package 2'),
                ],
              ),
              Row(
                children: [
                  Radio<int>(
                    value: 3,
                    groupValue: _selectedPackage,
                    onChanged: _handlePackageChange,
                  ),
                  Text('Package 3'),
                  SizedBox(width: 20),
                  Radio<int>(
                    value: 4,
                    groupValue: _selectedPackage,
                    onChanged: _handlePackageChange,
                  ),
                  Text('Package 4'),
                ],
              ),
              ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => BookingConfirmation(
                                  service: '',
                                )));
                  },
                  text: 'Continue')
            ],
          ),
        ),
      ),
    );
  }
}
