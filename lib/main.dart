import 'package:flutter/material.dart';
import 'package:mentalheathstartup/login_page.dart';
import 'home_page.dart';
import 'chats_page.dart';
import 'tasks_page.dart';
import 'subscriptions_page.dart';
import 'appointment_page.dart';

void main() {
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
