import 'package:flutter/material.dart';

class JobCardWidget extends StatelessWidget {
  JobCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowWidget(icon: Icons.home, text: 'Home'),
                    SizedBox(height: 8),
                    RowWidget(icon: Icons.calendar_today, text: 'Date'),
                    SizedBox(height: 8),
                    RowWidget(icon: Icons.location_on_sharp, text: 'Location'),
                  ],
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RowWidget(icon: Icons.person, text: 'John Mike'),
                RowWidget(icon: Icons.access_time, text: '15 Days ago'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  RowWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.blue,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job List'),
      ),
      body: ListView.builder(
        itemCount: 10, // Number of cards you want to display
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: JobCardWidget(),
          );
        },
      ),
    );
  }
}
