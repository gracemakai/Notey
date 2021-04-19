import 'package:flutter/material.dart';
import 'package:notey/helper/authentication.dart';
import 'package:notey/helper/util.dart';
import 'package:notey/screens/register_screen.dart';

import 'homePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void _authenticate(String email, String password){
    AuthenticationHelper()
        .signIn(email: email, password: password)
        .then((result) {
      if (result == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyHomePage()));
      } else {
        Util().showToast("Something wen't wrong", context);
      }
    });
  }

  void _areAllFieldsFilled(){
    if(_emailTextController.text.isNotEmpty && _passwordTextController.text.isNotEmpty){
      _authenticate(_emailTextController.text, _passwordTextController.text);
    }else {
      Util().showToast("Fill out all fields", context);

    }

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

  void _navigateToRegisterScreen(Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
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
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Welcome back",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    letterSpacing: 3),
                  ),
                  SizedBox(
                    height: 100,
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
                      border:  OutlineInputBorder(
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
                    style: TextStyle(color: Colors.white,),
                    controller: _passwordTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0,
                              style: BorderStyle.solid,
                              color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          gapPadding: 4),
                      border:  OutlineInputBorder(
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
                    height: 50,
                  ),
                  ElevatedButton(
                      child: Text(
                        "LogIn",
                        style: TextStyle(color: getColorFromHex("#000000")),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: getColorFromHex("#F9C906"),
                      ),
                      onPressed: () {
                        _areAllFieldsFilled();
                      }),
                  TextButton(
                    child: Text(
                      "No account?",
                      style: TextStyle(color: getColorFromHex("#F906B0")),
                    ),
                    onPressed: () {
                      _navigateToRegisterScreen(RegisterScreen());
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
