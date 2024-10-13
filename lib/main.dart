import 'package:flutter/material.dart';
import 'package:mentalheathstartup/home_page.dart';
import 'package:mentalheathstartup/login_page.dart';
import 'package:mentalheathstartup/otp_screen.dart';
import 'package:mentalheathstartup/phone_screen.dart';
import 'package:mentalheathstartup/firebase_option.dart';
import 'package:mentalheathstartup/provider/provider.dart';
import 'package:mentalheathstartup/chats_page.dart';
import 'package:mentalheathstartup/appointment_page.dart';
import 'package:mentalheathstartup/otp_screen.dart';
import 'package:mentalheathstartup/subscriptions_page.dart';
import 'package:mentalheathstartup/tasks_page.dart';
import 'package:provider/provider.dart';
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
