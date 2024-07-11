import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomerDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50, // Adjust the radius as needed
                      backgroundImage: AssetImage(
                          'assets/822.jpg'), // Ensure this path is correct and the image is added to your assets folder
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Thiru Maaran', // Customer Name
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Phone: 0147318602', // Customer Phone Number
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    Text(
                      'Email: Thiru92@gmail.com', // Customer Email
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    Text(
                      'Address: No. 38, Jalan Laman Setia 4/25, Taman Laman Setia, 81550 Gelang Patah, Johor.',
                      // Customer Address
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    Divider(),
                    Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.home, color: Colors.blue),
                            Gap(4),
                            Text(
                              'Terrace',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Type of House'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.layers, color: Colors.green),
                            Gap(4),
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Floors'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.bed, color: Colors.red),
                            Gap(4),
                            Text(
                              '4',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Rooms'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.bathtub, color: Colors.orange),
                            Gap(4),
                            Text(
                              '3',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Washrooms'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              Text(
                'Address Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Street name: Jalan Laman Setia 4/25\nPostal code: 81550\nCity: Gelang Patah\nState: Johor',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              Text(
                'NRIC',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '92092606XXXX',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
