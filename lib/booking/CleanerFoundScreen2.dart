import 'package:cleaning_app/screens/job_completed_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/elevatedButton_widget.dart';
import 'cleaner_details_screen.dart';

class CleanerArrivedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cleaner Found'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [],
      ),
      body: Stack(
        children: [
          // Map image as background
          Positioned.fill(
            child: Image.asset(
              'assets/map2.jpeg',
              // Ensure this path is correct and the image is added to your assets folder
              fit: BoxFit.cover,
            ),
          ),
          // Small photo of cleaner at top-right corner
          Positioned(
            top: 5,
            right: 10,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => CleanerDetailsScreen()));
              },
              child: CircleAvatar(
                radius: 30, // Adjust the radius as needed
                backgroundImage: AssetImage(
                    'assets/cleaner_photo.jpg'), // Ensure this path is correct and the image is added to your assets folder
              ),
            ),
          ),
          // Row with Chat and Arrived buttons at the bottom
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => CleanerDetailsScreen()));
                      },
                      child: Text('Guru Details'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => JobCompletedScreen()));
                      },
                      text: "Let's begin",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
