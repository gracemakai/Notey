import 'package:flutter/material.dart';
import 'package:notey/helper/authentication.dart';
import 'package:notey/helper/util.dart';

import 'homePage.dart';
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

  void _passwordsMatch(String password, String confirmPassword) {
    if(password.length < 6 && confirmPassword.length < 6){
      Util().showToast("Password should be at least 6 characters", context);
    }

    if (password == confirmPassword) {
      _authenticate(_emailTextController.text, _passwordTextController.text);
    } else {
      Util().showToast("Passwords don't match", context);
    }
  }

  void _areAllFieldsFilled() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _nameTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _confirmPasswordTextController.text.isNotEmpty) {
      if (Util().isEmailCorrect(_emailTextController.text)) {
        _passwordsMatch(
            _passwordTextController.text, _confirmPasswordTextController.text);
      } else {
        Util().showToast("Email format is incorrect", context);
      }
    } else {
      Util().showToast("Fill out all fields", context);

    }
  }

  void _authenticate(String email, String password) {
    AuthenticationHelper()
        .signUp(email: email, password: password)
        .then((result) {
      if (result == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else {
        Util().showToast("Something went wrong", context);
        print(result);

      }
    });
  }

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
                          obscureText: true,
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
                          obscureText: true,
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
                        onPressed: () {
                          _areAllFieldsFilled();
                        }),
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
