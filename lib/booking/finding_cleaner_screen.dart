import 'dart:async';

import 'package:cleaning_app/booking/cleaner_found_screen.dart';
import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
import 'package:flutter/material.dart';

class FindingCleanerScreen extends StatefulWidget {
  @override
  _SearchingForCleanerScreenState createState() =>
      _SearchingForCleanerScreenState();
}

class _SearchingForCleanerScreenState extends State<FindingCleanerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _showFoundButton = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();

    // Show the found button after 5 seconds
    Timer(Duration(seconds: 7), () {
      setState(() {
        _showFoundButton = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancel Search'),
          content: Text('Are you sure you want to cancel the search?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finding TidyGuru!'),
        leading: IconButton(
          onPressed: () {
            _showCancelDialog();
          },
          icon: Icon(Icons.cancel_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            // Map image as background
            Positioned.fill(
              child: Image.asset(
                'assets/map.jpeg',
                // Ensure this path is correct and the image is added to your assets folder
                fit: BoxFit.cover,
              ),
            ),

            // Cancel button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButtonWidget(
                onPressed: () {
                  _showCancelDialog();
                },
                text: 'Cancel Searching',
              ),
            ),

            // Center the ripple animations
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleRippleAnimation(
                    controller: _controller,
                    sizeFactor: 1.5,
                  ),
                  CircleRippleAnimation(
                    controller: _controller,
                    sizeFactor: 2.5,
                  ),
                  CircleRippleAnimation(
                    controller: _controller,
                    sizeFactor: 3.5,
                  ),
                  CircleRippleAnimation(
                    controller: _controller,
                    sizeFactor: 4.5,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/user image.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),

            // Show the found button after 5 seconds
            if (_showFoundButton)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                      width: double.infinity, // Make button take full width
                      height: 50, // Set desired height for the button
                      child: ElevatedButtonWidget(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => CleanerFoundScreen(
                                        isCleanerFound: true,
                                      )));
                        },
                        text: 'Tidy Guru Found',
                      )),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CircleRippleAnimation extends StatelessWidget {
  final AnimationController controller;
  final double sizeFactor;

  CircleRippleAnimation({required this.controller, required this.sizeFactor});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: Tween(begin: 0.0, end: 1.0).animate(controller).value *
              sizeFactor,
          child: Opacity(
            opacity: 1.0 - controller.value,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.5),
              ),
            ),
          ),
        );
      },
    );
  }
}
