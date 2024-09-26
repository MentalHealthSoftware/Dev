import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'app_layout.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime _currentDate = DateTime.now();
  DateTime? _selectedDate; // Allow null values
  String? _selectedTime; // Allow null values

  void _goToPreviousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    String monthYear = DateFormat.yMMMM().format(_currentDate);

    // Determine the first and last days of the month
    DateTime firstDayOfMonth =
        DateTime(_currentDate.year, _currentDate.month, 1);
    DateTime lastDayOfMonth =
        DateTime(_currentDate.year, _currentDate.month + 1, 0);

    // Create a list of dates to display
    List<DateTime?> dates = [];

    // Add dates from the previous month
    DateTime firstVisibleDay =
        firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday - 1));
    for (int i = 0; i < 35; i++) {
      dates.add(firstVisibleDay.add(Duration(days: i)));
    }

    return AppLayout(
      body: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              width: 235,
              height: 75,
              margin: const EdgeInsets.only(top: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
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
                          height: 1.5,
                          color: Color(0xFF003F5A),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Professional Therapist',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          color: Color(0xFF007A7A),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Qualifications',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          color: Color(0xFF007A7A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Schedule an Appointment',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 17,
                height: 1.5,
                color: Color(0xFF003F5A),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              height: 280,
              decoration: BoxDecoration(
                color:
                    Color.fromRGBO(198, 223, 223, 0.39), // Box background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  0, 122, 122, 0.41), // Button background color
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.chevron_left),
                              color: Colors.black, // Icon color
                              iconSize: 16,
                              onPressed: _goToPreviousMonth,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Text(
                          monthYear,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xFF003F5A),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  0, 122, 122, 0.41), // Button background color
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.chevron_right),
                              color: Colors.black, // Icon color
                              iconSize: 16,
                              onPressed: _goToNextMonth,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row for day names
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('MON', style: _dayNameTextStyle),
                        Text('TUE', style: _dayNameTextStyle),
                        Text('WED', style: _dayNameTextStyle),
                        Text('THU', style: _dayNameTextStyle),
                        Text('FRI', style: _dayNameTextStyle),
                        Text('SAT', style: _dayNameTextStyle),
                        Text('SUN', style: _dayNameTextStyle),
                      ],
                    ),
                  ),
                  // Grid for dates
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7, // 7 columns for each day of the week
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: 35, // 5 rows * 7 days
                      itemBuilder: (context, index) {
                        DateTime date = dates[index]!;
                        bool isCurrentMonth = date.month == _currentDate.month;
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _selectedDate == date
                                ? Color.fromRGBO(0, 122, 122,
                                    1) // Background color for selected date
                                : Colors
                                    .transparent, // Background color for other dates
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: _selectedDate == date
                                  ? Colors.transparent
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: InkWell(
                            onTap: isCurrentMonth
                                ? () {
                                    setState(() {
                                      _selectedDate = date;
                                    });
                                  }
                                : null,
                            child: SizedBox(
                              width: 23,
                              height: 23,
                              child: Center(
                                child: Text(
                                  '${date.day}',
                                  style: TextStyle(
                                    color: _selectedDate == date
                                        ? Colors
                                            .white // Text color for selected date
                                        : isCurrentMonth
                                            ? Color.fromRGBO(0, 63, 90, 1)
                                            : Color.fromRGBO(0, 63, 90,
                                                0.5), // 50% opacity for adjacent month dates
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 42.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Time',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color.fromRGBO(0, 122, 122, 1),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 122, 122,
                                1), // Background color for selected
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Selected',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Color.fromRGBO(0, 63, 90, 1),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(198, 223, 223,
                                0.86), // Background color for available
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Available',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Color.fromRGBO(0, 63, 90, 1),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 122, 122,
                                0.41), // Background color for unavailable
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Unavailable',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Color.fromRGBO(0, 63, 90, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildTimeButton('8:00 AM'),
                        _buildTimeButton('9:00 AM'),
                        _buildTimeButton('10:00 AM'),
                        _buildTimeButton('11:00 AM'),
                        _buildTimeButton('12:00 PM'),
                        _buildTimeButton('3:00 PM'),
                        _buildTimeButton('4:00 PM'),
                        _buildTimeButton('5:00 PM'),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: 305,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                            222, 102, 0, 1), // Button background color
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'CONTINUE TO PAYMENT',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      currentIndex: 0,
    );
  }

  Widget _buildTimeButton(String time) {
    bool isSelected = _selectedTime == time;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTime = time;
        });
      },
      child: Container(
        width: 70,
        height: 32,
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromRGBO(
                  0, 122, 122, 1) // Selected button background color
              : Color.fromRGBO(198, 223, 223, 0.39), // Button background color
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color.fromRGBO(0, 122, 122, 0.41), // Border color
          ),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: isSelected
                  ? Colors.white // Selected button text color
                  : Color.fromRGBO(0, 122, 122, 1), // Text color
            ),
          ),
        ),
      ),
    );
  }

  final TextStyle _dayNameTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Color.fromRGBO(0, 63, 90, 0.5), // 50% opacity
  );
}
