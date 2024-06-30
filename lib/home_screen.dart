import 'package:flutter/material.dart';
import 'package:mentalheathstartup/components/category_button.dart';
import 'package:mentalheathstartup/components/counseller_entry_widget.dart';
import 'package:mentalheathstartup/components/search_wallet_icon.dart';
import 'package:mentalheathstartup/login_page.dart';
import 'package:mentalheathstartup/otp_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<HomeScreen> {
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final List<Widget> _screens = [
    HomeScreen(),
    LoginScreen(),
    OTPScreen(),
  ];
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Consultation App'),
      // ),
      body: Text("data"),
      
      // ListView(
      //   children: [
      //     SearchAndWalletIcons(),
      //     CategoryButtons(),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Text('38 counsellors available'),
      //     ),
      //     // CounsellorEntry(
      //     //   name: 'Lorem Ipsum',
      //     //   experience: 3,
      //     //   rating: 4.2,
      //     //   reviews: 137,
      //     //   pricePerMinute: 10,
      //     // ),
      //     // Repeat CounsellorEntry with different data as needed
      //   ],
      // ),
    bottomNavigationBar: BottomNavigationBar(
        // currentIndex: _currentIndex,
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Consult',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
        ],
      ),
    );
  }
}