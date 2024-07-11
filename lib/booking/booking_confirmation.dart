import 'package:cleaning_app/providers/hour_notifier.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/select_date_time.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'booking_confirmation2.dart';

class BookingConfirmation extends ConsumerStatefulWidget {
  BookingConfirmation({Key? key, required this.service}) : super(key: key);

  final String service;

  @override
  _BookingConfirmationState createState() => _BookingConfirmationState();
}

class _BookingConfirmationState extends ConsumerState<BookingConfirmation> {
  TextEditingController _dateController = TextEditingController();
  String _selectedLocation = 'Kuala Lumpur';
  final List<String> _locations = [
    'Kuala Lumpur',
    'Selangor',
    'Johor',
    'Penang',
    'Negeri Sembilan'
  ];

  @override
  Widget build(BuildContext context) {
    int hour = ref.watch(hourProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.service}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/img.png',
                    height: 100,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          size: 16,
                          text: 'Cleaning Service',
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            TextWidget(
                              size: 14,
                              text: 'RM $hour/Hr',
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                ref.read(hourProvider.notifier).increment();
                              },
                              icon: Icon(Icons.add_circle_outlined),
                            ),
                            IconButton(
                              onPressed: () {
                                ref.read(hourProvider.notifier).decrement();
                              },
                              icon: Icon(Icons.remove_circle),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        TextWidget(
                          size: 14,
                          text: 'Total Price: RM ${hour * 55}',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1, height: 30),
              TextWidget(
                size: 16,
                text: 'About',
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
              SizedBox(height: 10),
              TextWidget(
                size: 14,
                text:
                    'Sweeping, Vacuuming and mopping floors. Cleaning and sanitizing Bathrooms, including toilets, sinks, tubs and showers. Cleaning kitchen appliances, countertops and sinks',
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Add Services'),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_box, size: 30),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: Colors.yellow.shade800,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton<String>(
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
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.notifications, color: Colors.blue),
                ],
              ),
              SizedBox(height: 20),
              SelectDateTime(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextWidget(
                    size: 16,
                    text: 'Total Payment:',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  TextWidget(
                    size: 16,
                    text: 'RM ${hour * 55}',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => BookingConfirmation2(),
                      ),
                    );
                  },
                  text: 'Continue',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
