import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContactUsScreen extends StatelessWidget {
  final String contactEmail = 'drtidypro@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Us for Feedback',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Gap(30),
              Text(
                'Email to: $contactEmail',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              Gap(30),
              Text(
                'Place your feedback here:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              Gap(10),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Type your feedback here...',
                  border: OutlineInputBorder(),
                ),
              ),
              Gap(20),
              Text(
                'Attach files (optional):',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              Gap(10),
              ElevatedButton.icon(
                onPressed: () {
                  // Add action to attach files
                },
                icon: Icon(Icons.attach_file),
                label: Text('Attach Files'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Gap(30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add action to submit feedback
                  },
                  child: Text('Submit Feedback'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
