import 'package:flutter/material.dart';
import 'package:my_cms_app/src/dashboard/dashboard.dart';
import 'package:my_cms_app/src/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMS App',
      theme: ThemeData(),
      home: CheckLoginStatus(), // Route to login checker
    );
  }
}

class CheckLoginStatus extends StatefulWidget {
  @override
  _CheckLoginStatusState createState() => _CheckLoginStatusState();
}

class _CheckLoginStatusState extends State<CheckLoginStatus> {
  bool _isLoggedIn = false; // Assume not logged in

  @override
  void initState() {
    super.initState();
    // Check login status
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return Dashboard();
    } else {
      return LoginScreen(); // Route to login if not logged in
    }
  }
}
