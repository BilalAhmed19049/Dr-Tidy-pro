import 'package:cleaning_app/screens/card_details_screen2.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SelectServiceScreen extends StatelessWidget {
  final List<String> services = <String>[
    'One Off Cleaning',
    'Office Cleaning',
    'Weekly Cleaning',
    'Post Renovation Cleaning',
    'Move In/Out cleaning',
  ];
  final List<int> colorsCodes = <int>[100, 200, 300, 400, 500];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Service')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextWidget(
                size: 15,
                text: 'Select Service to checkout',
                fontWeight: FontWeight.w400,
                color: Colors.black),
            Gap(10),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CardDetailsScreen2()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue[colorsCodes[index]],
                        ),
                        height: 70,
                        child:
                            Center(child: Text('Service ${services[index]}')),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: services.length),
            ),
            // ElevatedButtonWidget(onPressed: () { }, text: 'Proceed and Pay',)
          ],
        ),
      ),
    );
  }
}
