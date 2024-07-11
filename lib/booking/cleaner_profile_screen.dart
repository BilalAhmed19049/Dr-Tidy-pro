// import 'package:cleaning_app/screens/job_completed_screen.dart';
// import 'package:cleaning_app/widgets/elevatedButton_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
//
// class CleanerProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cleaner Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.share),
//             onPressed: () {
//               // Handle share button press
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundImage: AssetImage('assets/cleaner_photo.jpg'),
//               ),
//             ),
//             Gap(16),
//             Text(
//               'John Doe', // Cleaner Name
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Gap(8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(5, (index) {
//                 return Icon(
//                   index < 4 ? Icons.star : Icons.star_border,
//                   color: Colors.yellow.shade700,
//                 );
//               }),
//             ),
//             Gap(16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Icon(Icons.work, color: Colors.blue),
//                     Gap(4),
//                     Text(
//                       '120',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text('Jobs Completed'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Icon(Icons.reviews, color: Colors.green),
//                     Gap(4),
//                     Text(
//                       '4.5/5',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text('Reviews'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Icon(Icons.timer, color: Colors.red),
//                     Gap(4),
//                     Text(
//                       '5 mins',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text('ETA'),
//                   ],
//                 ),
//               ],
//             ),
//
//             Gap(32),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButtonWidget(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (ctx)=>JobCompletedScreen()));
//                 },
//                 text: 'Continue',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
