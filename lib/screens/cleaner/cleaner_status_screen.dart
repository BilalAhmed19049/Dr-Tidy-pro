import 'package:flutter/material.dart';

import '../../booking/cleaner_details_screen.dart';
import '../accepted_job_screen.dart';

class CleanerStatusScreen extends StatefulWidget {
  @override
  _CleanerStatusScreenState createState() => _CleanerStatusScreenState();
}

class _CleanerStatusScreenState extends State<CleanerStatusScreen>
    with SingleTickerProviderStateMixin {
  bool _isOnline = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  void _toggleOnlineStatus() {
    setState(() {
      _isOnline = !_isOnline;
    });
  }

  void _showJobDetailsDialog(BuildContext context) {
    // Data
    String firstName = 'Thiru';
    String lastName = 'Maaran';
    String mobileNumber = '0147318602';
    String email = 'Thiru92@gmail.com';
    String street = 'No. 38, Jalan Laman Setia 4/25';
    String postalCode = '81550';
    String city = 'Gelang Patah';
    String state = 'Johor';
    String typeOfHouse = 'Terrace';
    int floor = 2;
    int numberOfRooms = 4;
    int numberOfWashrooms = 3;
    String nric = '92092606XX';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Job Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('First Name', firstName),
              _buildDetailRow('Last Name', lastName),
              _buildDetailRow('Mobile number', mobileNumber),
              _buildDetailRow('Email', email),
              SizedBox(height: 12),
              Text('Address:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              _buildDetailRow('Street name', street),
              _buildDetailRow('Postal code', postalCode),
              _buildDetailRow('City', city),
              _buildDetailRow('State', state),
              SizedBox(height: 12),
              _buildDetailRow('Type of House', typeOfHouse),
              _buildDetailRow('Floor', floor.toString()),
              _buildDetailRow('No of rooms', numberOfRooms.toString()),
              _buildDetailRow('No of washrooms', numberOfWashrooms.toString()),
              _buildDetailRow('NRIC', nric),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Decline'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcceptJobScreen()),
                );
              },
              child: Text('Accept'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: '$label: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation =
        Tween<double>(begin: 1.0, end: 1.5).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/map.jpeg',
              // Ensure this path is correct and the image is added to your assets folder
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: Column(
              children: [
                InkWell(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/cleaner_photo.jpg'),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => CleanerDetailsScreen()));
                  },
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 4 ? Icons.star : Icons.star_border,
                      color: Colors.yellow.shade700,
                      size: 16,
                    );
                  }),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _isOnline,
            child: Positioned(
              top: 40,
              left: 16,
              child: ScaleTransition(
                scale: _animation,
                child: ElevatedButton(
                  onPressed: () {
                    _showJobDetailsDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(22),
                  ),
                  child: Text('Job Alert'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.location_on_sharp,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isOnline ? Colors.green : Colors.grey,
                  ),
                  onPressed: _toggleOnlineStatus,
                  child: Text(
                    _isOnline ? 'Online' : 'Offline',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
