//login_screen.dart

import 'package:flutter/material.dart';
import '../dashboard/dashboard.dart';
import '../model/user.dart';

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
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),

            //password field
            TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true),

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

      // Set the user information
      User.instance.setUser(usernameController.text);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Dashboard()));

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Incorrect Username or Password")));
    }
  }
}
