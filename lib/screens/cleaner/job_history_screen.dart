import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class JobHistoryScreen extends StatefulWidget {
  @override
  _JobHistoryScreenState createState() => _JobHistoryScreenState();
}

class _JobHistoryScreenState extends State<JobHistoryScreen> {
  List<Map<String, dynamic>> jobHistory = [
    {
      "date": "2024-07-01",
      "time": "10:00 AM",
      "duration": 2,
      "amount": 50.0,
      "location": "Kuala Lumpur",
      "rating": 4.5
    },
    {
      "date": "2024-06-25",
      "time": "2:00 PM",
      "duration": 3,
      "amount": 75.0,
      "location": "Selangor",
      "rating": 4.0
    },
    {
      "date": "2024-06-20",
      "time": "9:00 AM",
      "duration": 1.5,
      "amount": 37.5,
      "location": "Penang",
      "rating": 5.0
    },
    {
      "date": "2024-06-15",
      "time": "11:00 AM",
      "duration": 2.5,
      "amount": 62.5,
      "location": "Johor",
      "rating": 4.8
    },
    {
      "date": "2024-07-01",
      "time": "10:00 AM",
      "duration": 2,
      "amount": 50.0,
      "location": "Kuala Lumpur",
      "rating": 4.5
    },
    {
      "date": "2024-06-25",
      "time": "2:00 PM",
      "duration": 3,
      "amount": 75.0,
      "location": "Selangor",
      "rating": 4.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/cleaner_photo.jpg'), // Replace with your image asset path
            ),
            Gap(20),
            Text(
              'Siti Khatijah',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Gap(20),
            Expanded(
              child: ListView.builder(
                itemCount: jobHistory.length,
                itemBuilder: (context, index) {
                  final job = jobHistory[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.cleaning_services,
                          color: Colors.blueAccent),
                      title: Text('Job on ${job["date"]}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Time: ${job["time"]}'),
                          Text('Duration: ${job["duration"]} hours'),
                          Text('Amount: \$${job["amount"].toStringAsFixed(2)}'),
                          Text('Location: ${job["location"]}'),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                              Text(' ${job["rating"]}',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
