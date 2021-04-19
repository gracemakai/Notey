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

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
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
      backgroundColor: getColorFromHex("#0636F9"),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 3),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _nameTextController,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: getColorFromHex("#F906B0")),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _emailTextController,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: getColorFromHex("#F906B0")),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _phoneTextController,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: getColorFromHex("#F906B0")),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            hintText: "Phone",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _passwordTextController,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: getColorFromHex("#F906B0")),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _confirmPasswordTextController,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: getColorFromHex("#F906B0")),
                                borderRadius: BorderRadius.circular(10.0),
                                gapPadding: 4),
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                        child: Text(
                          "Register",
                          style: TextStyle(color: getColorFromHex("#000000")),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: getColorFromHex("#F9C906"),
                        ),
                        onPressed: () {}),
                  ),
                  TextButton(
                    child: Text(
                      "New user?",
                      style: TextStyle(color: getColorFromHex("#F906B0")),
                    ),
                    onPressed: () {
                      _navigateToLoginScreen();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


