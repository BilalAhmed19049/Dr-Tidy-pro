import 'dart:async';

import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../booking/rate_experience.dart';

class JobCompletedScreen extends StatefulWidget {
  @override
  _JobCompletedScreenState createState() => _JobCompletedScreenState();
}

class _JobCompletedScreenState extends State<JobCompletedScreen> {
  late Timer _timer;
  Duration _duration = Duration(minutes: 120);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration.inSeconds == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _duration = Duration(seconds: _duration.inSeconds - 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<void> _callSOS() async {
    const emergencyNumber = 'tel:999';
    if (await canLaunchUrl(Uri.parse(emergencyNumber))) {
      await launchUrl(Uri.parse(emergencyNumber));
    } else {
      throw 'Could not launch $emergencyNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Job on-going'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100, // Adjust the radius as needed
              backgroundImage: AssetImage(
                  'assets/cleaner_photo.jpg'), // Ensure this path is correct and the image is added to your assets folder
            ),
            SizedBox(height: 20),
            Text(
              'Job Completion Time',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _formatDuration(_duration),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity, // Make button take full width
              height: 50, // Set desired height for the button
              child: ElevatedButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => RateExperienceScreen()));
                },
                text: 'Job Completed',
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity, // Make button take full width
              height: 50, // Set desired height for the button
              child: ElevatedButton(
                onPressed: _callSOS,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Set the button color to red
                ),
                child: Text(
                  'SOS',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white), // Set the text color to white
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
