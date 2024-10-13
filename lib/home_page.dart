import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/specialist.dart';
import 'app_layout.dart';
import 'appointment_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String clickedBox = 'Counsellors';
  List<Specialist> specialists = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response) as List;
    setState(() {
      specialists = data.map((json) => Specialist.fromJson(json)).toList();
    });
  }

  List<Specialist> _getSpecialistsByCategory(String category) {
    return specialists
        .where((specialist) => specialist.category == category)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: _buildBody(),
      currentIndex: 0,
    );
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _buildCategoryBox(
                  'Counsellors', 'Subtitle for Counsellors', 'Counsellors'),
              SizedBox(width: 8),
              _buildCategoryBox(
                  'Therapists', 'Subtitle for Therapists', 'Therapists'),
              SizedBox(width: 8),
              _buildCategoryBox('Psychiatrists', 'Subtitle for Psychiatrists',
                  'Psychiatrists'),
            ]),
            SizedBox(height: 8),
            _buildAvailabilityText(),
            SizedBox(height: 8),
            Expanded(
              child: specialists.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _getSpecialistsByCategory(clickedBox).length,
                      itemBuilder: (context, index) {
                        return _buildSpecialistBox(
                            _getSpecialistsByCategory(clickedBox)[index]);
                      },
                    ),
            ),
          ],
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
    int availableCount = _getSpecialistsByCategory(clickedBox).length;
    String availabilityText =
        '$availableCount ${clickedBox.toLowerCase()} available';

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

  Widget _buildSpecialistBox(Specialist specialist) {
    return Container(
      margin: EdgeInsets.all(8),
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
                        specialist.name,
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
                            specialist.isHeartFilled =
                                !specialist.isHeartFilled;
                          });
                        },
                        child: Icon(
                          specialist.isHeartFilled
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Color(0xFF003F5A),
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    specialist.experience,
                    style: TextStyle(
                      color: Color(0xFF007A7A),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                  Row(
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
                        specialist.rating.toString(),
                        style: TextStyle(
                          color: Color(0xFF007A7A),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "(${specialist.reviews} reviews)",
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
                        "Billed @ ₹${specialist.billedRate}/min",
                        style: TextStyle(
                          color: Color(0xFF003F5A),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(_createRoute());
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

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          AppointmentPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
