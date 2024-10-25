import 'package:flutter/material.dart';
import '../app_layout.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: Center(
        child: Text('Chats Page'),
      ),
      currentIndex: 1,
    );
  }
}
