import 'package:flutter/material.dart';
import 'app_layout.dart'; // Import the AppLayout
import 'appointment_page.dart'; // Import the AppointmentPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String clickedBox = 'Counsellors'; // Set an initial value
  List<bool> isHeartFilled = [
    false,
    false,
    false,
    false
  ]; // State to manage heart icon fill status

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: _buildBody(),
      currentIndex: 0, // Set the current index for the BottomNavigationBar
    );
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white, // Fixed background color
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 16), // Adjusted space between app bar and boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryBox(
                      'Counsellors', 'Subtitle for Counsellors', 'Counsellors'),
                  SizedBox(width: 8), // Space between boxes
                  _buildCategoryBox(
                      'Therapists', 'Subtitle for Therapists', 'Therapists'),
                  SizedBox(width: 8), // Space between boxes
                  _buildCategoryBox('Psychiatrists',
                      'Subtitle for Psychiatrists', 'Psychiatrists'),
                ],
              ),
              SizedBox(height: 8), // Reduced space between boxes and text
              _buildAvailabilityText(),
              SizedBox(
                  height: 8), // Reduced space between text and additional boxes
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildAdditionalBox(0),
                      SizedBox(height: 8),
                      _buildAdditionalBox(1),
                      SizedBox(height: 8),
                      _buildAdditionalBox(2),
                      SizedBox(height: 8),
                      _buildAdditionalBox(3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryBox(String title, String subtitle, String boxKey) {
    bool isClicked = clickedBox == boxKey;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (clickedBox != boxKey) {
              clickedBox = boxKey;
            }
          });
        },
        child: Container(
          height: 137,
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(21),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: isClicked ? 0.7 * 137 : 33,
                  decoration: BoxDecoration(
                    color: Color(0xFFC6DFDF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Color(0xFF003F5A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            fontSize: 14,
                          ),
                        ),
                        if (isClicked)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              subtitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF007A7A),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvailabilityText() {
    String availabilityText;
    switch (clickedBox) {
      case 'Therapists':
        availabilityText = '27 therapists available';
        break;
      case 'Psychiatrists':
        availabilityText = '38 psychiatrists available';
        break;
      default:
        availabilityText = '38 counsellors available';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          availabilityText,
          style: TextStyle(
            color: Color(0xFF003F5A),
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            fontSize: 14,
          ),
        ),
        SizedBox(width: 8),
        Container(
          height: 16,
          width: 2,
          color: Color(0xFF007A7A),
        ),
      ],
    );
  }

  Widget _buildAdditionalBox(int index) {
    return Container(
      width: 379,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFC6DFDF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lorem Ipsum",
                        style: TextStyle(
                          color: Color(0xFF003F5A),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isHeartFilled[index] = !isHeartFilled[index];
                          });
                        },
                        child: Icon(
                          isHeartFilled[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Color(0xFF003F5A),
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "3 years experience",
                    style: TextStyle(
                      color: Color(0xFF007A7A),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFEA02F),
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFFEA02F),
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFFEA02F),
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xFFFEA02F),
                        size: 10,
                      ),
                      Icon(
                        Icons.star_half,
                        color: Color(0xFFFEA02F),
                        size: 10,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "4.2",
                        style: TextStyle(
                          color: Color(0xFF007A7A),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                      Spacer(), // Add a Spacer to push reviews text to the end
                      Text(
                        "(137 reviews)",
                        style: TextStyle(
                          color: Color(0xFF007A7A),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Billed @ ₹10/min",
                        style: TextStyle(
                          color: Color(0xFF003F5A),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/appointment');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Color(0xFFDE6600),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 18,
                          child: Center(
                            child: Text(
                              "Make Appointment",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
