


import 'package:flutter/material.dart';
import 'package:mentalheathstartup/login_page.dart';
import 'package:mentalheathstartup/otp_screen.dart';
import 'package:mentalheathstartup/phone_screen.dart';
import 'package:mentalheathstartup/home_screen.dart';


Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // Run your app
  runApp(const MyApp());
}
// void main() {
  
//   runApp(MaterialApp(
//     initialRoute: 'phone',
//     debugShowCheckedModeBanner: false,
//     routes: {
//       'phone': (context) => MyPhone(),
//       'verify': (context) => MyVerify()
//     },
//   ));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        // '/home': (context) => HomeScreen(),
        '/otp': (context) => OTPScreen(),

      },
    );
  }
}
// Bef