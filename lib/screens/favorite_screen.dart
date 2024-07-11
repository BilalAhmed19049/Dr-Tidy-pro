import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                  child: TextWidget(
                      size: 16,
                      text: 'No Subscription',
                      fontWeight: FontWeight.w400,
                      color: Colors.black))
            ],
          ),
        ),
      ),
    );
  }
}
