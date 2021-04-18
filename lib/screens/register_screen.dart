import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  void _navigateToLoginScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/app_icon_plate.png",
                    height: 100,
                    width: 100,
                  ),
                  TextField(
                    controller: _nameTextController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                  TextField(
                    controller: _emailTextController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                  TextField(
                    controller: _phoneTextController,
                    decoration: InputDecoration(
                      hintText: "Phone",
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                  TextField(
                    controller: _passwordTextController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                  TextField(
                    controller: _confirmPasswordTextController,
                    decoration: InputDecoration(
                      hintText: "Confirm password",
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                        child: Text("Register"), onPressed: () {}),
                  ),
                  TextButton(
                    child: Text("New user?"),
                    onPressed: () {
                      _navigateToLoginScreen();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}
