// import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:mentalheathstartup/login_page.dart';
import 'package:mentalheathstartup/otp_screen.dart';
import 'package:mentalheathstartup/phone_screen.dart';
import 'package:mentalheathstartup/home_screen.dart';

Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //To block reCAPCHA, after publishing app on play store

  // await FirebaseAppCheck.instance.activate(
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   androidProvider: AndroidProvider.debug,
  //   appleProvider: AppleProvider.appAttest,
  // );
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/otp': (context) => OTPScreen(),
      },
    );
  }
}
// Bef