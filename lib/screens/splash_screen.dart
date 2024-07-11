import 'package:cleaning_app/screens/landing_page.dart';
import 'package:flutter/material.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    super.initState();
    _naviagettomain();
  }

  _naviagettomain() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LandingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/logoimage.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
