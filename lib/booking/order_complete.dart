import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/done_prev_ui.png',
              // Replace with your tick icon image path
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Order completed successfully',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Gap(50),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text('Rate Us')))
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
