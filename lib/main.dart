


import 'package:flutter/material.dart';
import 'package:mentalheathstartup/phone_screen.dart';
import 'package:mentalheathstartup/verify_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify()
    },
  ));
}