import 'dart:async';

import 'package:cleaning_app/booking/cleaner_found_screen.dart';
import 'package:cleaning_app/booking/rating_screen.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AcceptJobScreen extends StatefulWidget {
  @override
  _AcceptJobScreenState createState() => _AcceptJobScreenState();
}

class _AcceptJobScreenState extends State<AcceptJobScreen> {
  late Timer _timer;
  int _start = 7200; // Timer starts at 2 hours (7200 seconds)

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get timerText {
    int hours = _start ~/ 3600;
    int minutes = (_start % 3600) ~/ 60;
    int seconds = _start % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void _showGPSLocation() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => CleanerFoundScreen(
                  isCleanerFound: false,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Accepted'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.cyanAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Job Details',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Job Type: Standard Cleaning',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                'Duration: 2 hours',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 24),
              Text(
                'Time Remaining',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                timerText,
                style: TextStyle(fontSize: 48, color: Colors.red),
              ),
              Gap(100),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: _showGPSLocation,
                    icon: Icon(Icons.gps_fixed),
                    label: Text('GPS'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  SizedBox(width: 16),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => RatingScreen()));
                      },
                      text: 'Job Completed',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
