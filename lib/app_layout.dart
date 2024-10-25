import 'package:flutter/material.dart';
import 'components/app_bar.dart';
import 'BottomNavBar/bottom_navigation_bar.dart';

class AppLayout extends StatefulWidget {
  final Widget body;
  final int currentIndex;

  AppLayout({required this.body, required this.currentIndex});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: widget.body,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
              break;
            case 1:
              Navigator.pushNamedAndRemoveUntil(
                  context, '/chats', (route) => false);
              break;
            case 2:
              Navigator.pushNamedAndRemoveUntil(
                  context, '/tasks', (route) => false);
              break;
            case 3:
              Navigator.pushNamedAndRemoveUntil(
                  context, '/subscriptions', (route) => false);
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
