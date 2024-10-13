import 'package:flutter/material.dart';
import 'package:mentalheathstartup/firebase_option.dart';
import 'package:mentalheathstartup/login_page.dart';
import 'package:mentalheathstartup/provider/provider.dart';
import 'home_page.dart';
import 'chats_page.dart';
import 'tasks_page.dart';
import 'subscriptions_page.dart';
import 'package:provider/provider.dart';
import 'appointment_page.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: authProvider.isSignedIn ? '/home' : '/login',
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
