import 'package:flutter/material.dart';
import 'app_layout.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: Container(
        color: Colors.white, // Set the background color of the page to white
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              width: 235,
              height: 75,
              margin:
                  const EdgeInsets.only(top: 16.0), // Margin below the AppBar
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    8), // Rounded corners for the main box
              ),
              child: Row(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(
                          4), // Radius for the left-side box
                    ),
                  ),
                  SizedBox(width: 16), // Spacing between the boxes
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dr. Lorem Ipsum',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          height:
                              1.5, // This sets the line height (21px = 1.5 * 14px)
                          color: Color(0xFF003F5A),
                        ),
                      ),
                      SizedBox(height: 4), // Gap between text lines
                      Text(
                        'Professional Therapist',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height:
                              1.5, // This sets the line height (18px = 1.5 * 12px)
                          color: Color(0xFF007A7A),
                        ),
                      ),
                      SizedBox(height: 4), // Gap between text lines
                      Text(
                        'Qualifications',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height:
                              1.5, // This sets the line height (18px = 1.5 * 12px)
                          color: Color(0xFF007A7A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Spacing between the sections
            Text(
              'Schedule an Appointment',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 17,
                height: 1.5, // This sets the line height (25.5px = 1.5 * 17px)
                color: Color(0xFF003F5A),
              ),
            ),
            SizedBox(height: 10), // Space between text and box
            Container(
              width: 300,
              height: 280,
              decoration: BoxDecoration(
                color: Color(0xFFC6DFDF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ), // Rounded corners only for the top
              ),
            ),
          ],
        ),
      ),
      currentIndex: 0, // No active button for appointment page
    );
  }
}
