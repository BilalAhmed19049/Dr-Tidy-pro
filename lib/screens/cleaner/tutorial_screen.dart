import 'package:cleaning_app/screens/cleaner/guru_homescreen.dart';
import 'package:cleaning_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TutorialScreen extends StatefulWidget {
  TutorialScreen({Key? key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  bool watchedTutorial = false;
  final String videoUrl =
      'https://youtu.be/FfYwhQnquiE'; // Replace with your video URL

  void _launchURL() async {
    if (await canLaunchUrl(Uri.parse(videoUrl))) {
      await launchUrl(Uri.parse(videoUrl));
    } else {
      throw 'Could not launch $videoUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            TextWidget(
                size: 18,
                text: 'Watch tutorial in order to complete your registration',
                fontWeight: FontWeight.normal,
                color: Colors.black),
            Center(
              child: GestureDetector(
                onTap: _launchURL,
                child: Text(
                  'Watch Tutorial',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: watchedTutorial,
                        onChanged: (value) {
                          setState(() {
                            watchedTutorial = value!;
                          });
                        },
                      ),
                      Text('I have watched the tutorial'),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: watchedTutorial
                        ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => GuruHomescreen()));
                          }
                        : null, // Disable button if tutorial is not watched
                    child: Text('Proceed'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
