import 'package:cleaning_app/screens/cleaner/cleaner_status_screen.dart';
import 'package:cleaning_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../booking/cleaner_details_screen.dart';
import '../../ewallet_screen.dart';
import '../../widgets/text_widget.dart';
import '../customer/contactus_screen.dart';
import 'job_history_screen.dart';

class GuruHomescreen extends StatelessWidget {
  GuruHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        //  useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: NavigationDrawer(),
          appBar: AppBar(
            title: Text('My Jobs'),
            // actions: [
            //   ClipOval(
            //       child: Image.asset(
            //     'assets/cleaner_photo.jpg',
            //     fit: BoxFit.fitWidth,
            //   )),
            // ],
            bottom: TabBar(
              tabs: [
                Tab(
                    child: TextWidget(
                        size: 12,
                        text: 'Active',
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
                Tab(
                    child: TextWidget(
                        size: 10,
                        text: 'In-Progress',
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
                Tab(
                    child: TextWidget(
                        size: 10,
                        text: 'Job History',
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
                Tab(
                    child: TextWidget(
                        size: 10,
                        text: 'Cancelled',
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CleanerStatusScreen(),
              Center(child: Text('Currently no Active Job ')),
              JobHistoryScreen(),
              Center(child: Text('Cancelled Jobs')),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Tidy Pro',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => CleanerDetailsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.wallet),
            title: Text('E-Wallet'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => EWalletScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => ContactUsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen(
                            userType: '',
                            ctx: context,
                          )));
            },
          ),
        ],
      ),
    );
  }
}
