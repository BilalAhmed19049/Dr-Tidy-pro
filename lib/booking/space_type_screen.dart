import 'package:cleaning_app/booking/booking_confirmation.dart';
import 'package:cleaning_app/booking/packages_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/elevatedButton_widget.dart';

class SpaceTypeScreen extends StatelessWidget {
  SpaceTypeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Space type'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_1.png',
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _showDialog(context, 'Residential');
                },
                label: Text('Residential'),
                icon: Icon(Icons.home),
              ),
              Gap(50),
              Text('The image for commercial rate to be placed here'),
              ElevatedButton.icon(
                onPressed: () {
                  _showDialog(context, 'Commercial');
                },
                label: Text('Commercial'),
                icon: Icon(Icons.apartment),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String spaceType) {
    showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text('$spaceType'),
            actions: <Widget>[
              ElevatedButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => BookingConfirmation(
                                service: 'Instant booking',
                              )));
                },
                text: 'Instant Booking ',
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButtonWidget(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => PackagesScreen()));
                },
                text: 'Packages',
              ),
            ],
          );
        });
  }
}
