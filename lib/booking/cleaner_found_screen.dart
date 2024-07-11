import 'dart:async';

import 'package:cleaning_app/booking/CleanerFoundScreen2.dart';
import 'package:flutter/material.dart';

class CleanerFoundScreen extends StatefulWidget {
  final bool isCleanerFound;

  CleanerFoundScreen({required this.isCleanerFound});

  @override
  _CleanerFoundScreenState createState() => _CleanerFoundScreenState();
}

class _CleanerFoundScreenState extends State<CleanerFoundScreen> {
  late Timer _timer;
  int _start = 720; // 12 minutes in seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

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
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get _formattedTime {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            // Map image as background
            Positioned.fill(
              child: Image.asset(
                'assets/map2.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            // Countdown timer at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Text(
                  'Time remaining: $_formattedTime',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
            ),
            // Continue button at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity, // Make button take full width
                  height: 50, // Set desired height for the button
                  child: widget.isCleanerFound
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => CleanerArrivedScreen()));
                          },
                          child: Text(
                            'Arrived',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
