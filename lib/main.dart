import 'package:flutter/material.dart';
import 'package:mentalheathstartup/Profile/RegisterAsPractitioner/LinearProgress.dart';
import 'package:mentalheathstartup/Firebase/firebase_options.dart';
import 'package:mentalheathstartup/BottomNavBar/Consult/home_page.dart';
import 'package:mentalheathstartup/Login/login_page.dart';
import 'package:mentalheathstartup/Login/otp_screen.dart';
import 'package:mentalheathstartup/BottomNavBar/chats_page.dart';
import 'package:mentalheathstartup/BottomNavBar/Consult/appointment_page.dart';
import 'package:mentalheathstartup/Login/otp_screen.dart';
import 'package:mentalheathstartup/BottomNavBar/subscriptions_page.dart';
import 'package:mentalheathstartup/BottomNavBar/tasks_page.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Inter',
      ),
      initialRoute: '/login',
      routes: {
        '/otp': (context) => OTPScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/chats': (context) => ChatsPage(),
        '/tasks': (context) => TasksPage(),
        '/subscriptions': (context) => SubscriptionsPage(),
        '/appointment': (context) => AppointmentPage(),
      },
    );
  }
}
