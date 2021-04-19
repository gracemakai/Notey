import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Util{
  bool isEmailCorrect(String email){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  void showToast(String msg, BuildContext context, {int duration, int gravity}) {
    Toast.show(msg, context, duration: 1, gravity: 0);
  }

}