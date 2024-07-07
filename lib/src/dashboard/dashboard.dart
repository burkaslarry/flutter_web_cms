import 'package:flutter/material.dart';
import '../login/login.dart';
import '../model/user.dart';
import 'components/mainpage/coursecontentpage.dart';
import 'components/mainpage/reportpage.dart';
import 'components/mainpage/studentpage.dart';
import 'components/menu/leftmenu.dart';
import 'components/menu/menuitem.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<Dashboard> {
  // Access the global key in the build method
  static List<MenuItem> menuList = [
    MenuItem(title: 'Course Material', icon: Icons.menu_book),
    MenuItem(title: 'Student Enrollment', icon: Icons.people),
    MenuItem(title: 'Reports', icon: Icons.insert_chart),
  ];

  int _currentContentIndex = 0;

  final List<Widget> _contentAreas = [
    CourseContentArea(),
    StudentEnrollmentArea(),
    ReportArea(),
  ];

  void _updateContentArea(int index) {
    setState(() {
      _currentContentIndex = index;
    });
  }

  void _showUserOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('User Profile'),
                onTap: () {
                  // Handle user profile
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Change Language'),
                onTap: () {
                  // Handle change language
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Handle logout and navigate to login page
                  Navigator.of(context).pop();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renewable Course Content Management System',  style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              _showUserOptions(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(child: Text(User.instance.username, style: const TextStyle(color: Colors.white))), // Display username
          ),
        ],
      ),
      body: Row(
        children: [
          // Left Menu
          Expanded(
            flex: 2,
            child: LeftMenu(menuList, _updateContentArea),

          ),
          // Right Content Area
          Expanded(
            flex: 5,
            child: _contentAreas[_currentContentIndex],
          ),
        ],
      ),
    );
  }
}
