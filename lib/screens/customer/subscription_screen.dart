import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/elevatedButton_widget.dart';

class SubscriptionScreen extends StatelessWidget {
  final String package = 'Package 1';
  final int usedHours = 4;
  final int balanceHours = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Details'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Your Current Package',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Gap(30),
            SubscriptionDetailWidget(
              icon: Icons.assignment,
              title: 'Package',
              value: package,
              color: Colors.blue,
            ),
            Gap(20),
            SubscriptionDetailWidget(
              icon: Icons.timer,
              title: 'Used',
              value: '$usedHours hours',
              color: Colors.orange,
            ),
            Gap(20),
            SubscriptionDetailWidget(
              icon: Icons.access_time,
              title: 'Balance',
              value: '$balanceHours hours',
              color: Colors.green,
            ),
            Spacer(),
            ElevatedButtonWidget(
              onPressed: () {
                // Add action for renewing subscription
              },
              text: 'Renew Subscription',
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}

class SubscriptionDetailWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const SubscriptionDetailWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
