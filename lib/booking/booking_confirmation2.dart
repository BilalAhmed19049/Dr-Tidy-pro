import 'package:cleaning_app/providers/hour_notifier.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:cleaning_app/widgets/select_date_time.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../booking/finding_cleaner_screen.dart';

class BookingConfirmation2 extends ConsumerStatefulWidget {
  BookingConfirmation2({
    Key? key,
  }) : super(key: key);

  @override
  _BookingConfirmation2State createState() => _BookingConfirmation2State();
}

class _BookingConfirmation2State extends ConsumerState<BookingConfirmation2> {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int hour = ref.watch(hourProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Review Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/img.png',
                    height: 100,
                  ),
                  SizedBox(width: 20),
                  Column(
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
                            text: '$hour/Hr',
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.edit),
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
                ],
              ),
              Divider(thickness: 1, height: 30),
              TextWidget(
                size: 16,
                text: 'About',
                fontWeight: FontWeight.bold,
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
              SelectDateTime(),
              SizedBox(height: 20),
              Row(
                children: [
                  TextWidget(
                    size: 14,
                    text: 'Customer Name:',
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  Spacer(),
                  TextWidget(
                    size: 14,
                    text: 'Thiru Maaran',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  TextWidget(
                    size: 14,
                    text: 'Address:',
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  Spacer(),
                  Expanded(
                    child: TextWidget(
                      size: 14,
                      text:
                          'No. 38, Jalan Laman Setia 4/25, Taman Laman Setia, 81550 Gelang Patah, Johor.',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              Row(
                children: [
                  TextWidget(
                    size: 14,
                    text: 'Price: RM ${hour * 55} + tax',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  Spacer(),
                  TextWidget(
                    size: 14,
                    text: 'Total Price: RM ${hour * 55 + 10}',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ],
              ),
              TextWidget(
                size: 12,
                text: 'Subscription: 6 hours remaining',
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
              Gap(30),
              Center(
                child: ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => FindingCleanerScreen(),
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
