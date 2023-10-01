//login_screen.dart

import 'package:flutter/material.dart';
import '../dashboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //username field
            TextField(
              controller: usernameController,
            ),

            //password field
            TextField(controller: passwordController, obscureText: true),

            //login button
            ElevatedButton(
                onPressed: () => _login(context), child: Text("Login"))
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    if (usernameController.text == "admin" &&
        passwordController.text == "root") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Dashboard()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Incorrect Username or Password")));
    }
  }
}
