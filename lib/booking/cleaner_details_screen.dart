import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CleanerDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
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
                          'assets/cleaner_photo.jpg'), // Ensure this path is correct and the image is added to your assets folder
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Siti Khatijah', // Cleaner Name
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Phone: 0106728765', // Cleaner Phone Number
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    Text(
                      'Email: Khate123@gmail.com', // Cleaner Email
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    Text(
                      'Address: No. 18, Jalan Sentral 5, Taman Nusa Sentral, 81550 Gelang Patah, Johor.',
                      // Cleaner Address
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    Divider(),
                    Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.work, color: Colors.blue),
                            Gap(4),
                            Text(
                              '120',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Jobs Completed'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.reviews, color: Colors.green),
                            Gap(4),
                            Text(
                              '4.5/5',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Reviews'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Completed Jobs',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '25', // Completed Jobs
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < 4 ? Icons.star : Icons.star_border,
                            // Adjust rating
                            color: Colors.yellow.shade700,
                            size: 24,
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              Text(
                'Cleaner Bio',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Siti Khatijah has been a professional cleaner for over 5 years. She specializes in residential and commercial cleaning, and is known for her attention to detail and exceptional service.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              Text(
                'Skills',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  Chip(
                    label: Text('Residential Cleaning'),
                  ),
                  Chip(
                    label: Text('Commercial Cleaning'),
                  ),
                  Chip(
                    label: Text('Deep Cleaning'),
                  ),
                  Chip(
                    label: Text('Eco-friendly Products'),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 24),
              Text(
                'Recent Reviews',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Jane Smith'),
                subtitle: Text(
                    'Siti did a fantastic job! My house has never been cleaner. Highly recommend!'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 5 ? Icons.star : Icons.star_border,
                      color: Colors.yellow.shade700,
                      size: 16,
                    );
                  }),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Michael Johnson'),
                subtitle:
                    Text('Very professional and thorough. Will hire again.'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 4 ? Icons.star : Icons.star_border,
                      color: Colors.yellow.shade700,
                      size: 16,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
