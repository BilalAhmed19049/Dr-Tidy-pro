import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'order_complete.dart';

class RateExperienceScreen extends StatefulWidget {
  @override
  _RateExperienceScreenState createState() => _RateExperienceScreenState();
}

class _RateExperienceScreenState extends State<RateExperienceScreen> {
  int _selectedStars = 0; // Track selected stars, 0 means no stars selected
  String _additionalNote = ''; // Track additional note or compliment

  void _selectStars(int stars) {
    setState(() {
      _selectedStars = stars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Your Experience'),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rate your Guru!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Center(
                child: CircleAvatar(
                  radius: 50, // Adjust the radius as needed
                  backgroundImage: AssetImage(
                      'assets/cleaner_photo.jpg'), // Ensure this path is correct and the image is added to your assets folder
                ),
              ),
              Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Five stars for rating
                  for (int i = 1; i <= 5; i++)
                    IconButton(
                      icon: Icon(
                        _selectedStars >= i ? Icons.star : Icons.star_border,
                        color: Colors.yellow.shade700,
                        size: 40,
                      ),
                      onPressed: () {
                        _selectStars(i);
                      },
                    ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Additional Note or Compliment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              // Text field for additional note or compliment
              TextField(
                onChanged: (value) {
                  setState(() {
                    _additionalNote = value;
                  });
                },
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Write your note here...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => OrderCompletedScreen()));
                  },
                  text: 'Task Completed',
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
