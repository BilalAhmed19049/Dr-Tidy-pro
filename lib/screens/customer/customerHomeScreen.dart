import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../booking/space_type_screen.dart';
import '../../widgets/elevatedButton_widget.dart';
import '../../widgets/text_widget.dart';
import '../select_service_screen.dart';

class CstHomeScreen extends StatefulWidget {
  CstHomeScreen({
    super.key,
  });

  @override
  State<CstHomeScreen> createState() => _CstHomeScreenState();
}

class _CstHomeScreenState extends State<CstHomeScreen> {
  String _selectedLocation = 'Kuala Lumpur';
  final List<String> _locations = [
    'Kuala Lumpur',
    'Selangor',
    'Johor',
    'Penang',
    'Negeri Sembilan'
  ]; // Default value
  final List<String> _packages = [
    'Package 1',
    'Package 2',
    'Package 3',
    'Package 4'
  ];
  final List<String> _packagespath = [
    'assets/packages/package1.jpg',
    'assets/packages/package2.jpg',
    'assets/packages/package3.jpg',
    'assets/packages/package4.jpg'
  ];

  TextEditingController searchcotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  size: 14,
                  text: 'Location',
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
              Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: Colors.yellow.shade800,
                  ),
                  DropdownButton<String>(
                    value: _selectedLocation,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLocation = newValue!;
                      });
                    },
                    items: _locations
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  )
                ],
              ),
              Gap(10),
              TextWidget(
                  size: 16,
                  text: 'Special Discounts',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/flashsale.jpg',
                      ))),
              Gap(10),
              TextWidget(
                  size: 16,
                  text: "Services",
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        height: 80,
                        // specify the height as per your requirement
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)
                            // optional, to see the border
                            ),
                        child: ServiceWidget(
                          image: 'assets/icons/cleaning_995053.png',
                          text: 'Standard Cleaning',
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => SpaceTypeScreen()));
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  // use SizedBox for spacing instead of Gap
                  Expanded(
                    child: InkWell(
                      child: Container(
                        height: 80,
                        // specify the height as per your requirement
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)
// optional, to see the border
                            ),
                        child: ServiceWidget(
                          image: 'assets/icons/cleaning-service_3929083.png',
                          text: 'Deep Cleaning',
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => SpaceTypeScreen()));
                      },
                    ),
                  ),
                ],
              ),
              Gap(10),
              TextWidget(
                  size: 16,
                  text: 'Our Packages',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              SizedBox(
                height: 200, // Set a fixed height for the horizontal list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _packages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    _packagespath[index],
                                    height: 130,
                                    width: 130,
                                    fit: BoxFit.contain,
                                  ),
                                  Gap(10),
                                  Text(_packages[index]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectServiceScreen()));
                },
                text: 'Grab your service now!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 60,
        ),
        TextWidget(
            size: 10,
            text: text,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ],
    );
  }
}
