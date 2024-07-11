import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'order_complete.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _selectedStars = 0; // Track selected stars, 0 means no stars selected
  String _feedback = ''; // Track feedback or complaints

  void _selectStars(int stars) {
    setState(() {
      _selectedStars = stars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate the Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  // CircleAvatar(
                  //   radius: 50, // Adjust the radius as needed
                  //   backgroundImage: AssetImage('assets/cleaner_photo.jpg'), // Ensure this path is correct and the image is added to your assets folder
                  // ),
                  Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          _selectedStars >= index + 1
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.yellow.shade700,
                          size: 40,
                        ),
                        onPressed: () {
                          _selectStars(index + 1);
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Special Instructions or Complaints',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            TextField(
              onChanged: (value) {
                setState(() {
                  _feedback = value;
                });
              },
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Write your feedback here...',
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => OrderCompletedScreen()));
                },
                text: 'Submit',
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
