import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'app_layout.dart'; // Import the AppLayout

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  DateTime now = DateTime.now();
  int completedTasks = 0;
  List<bool> taskCompletionStatus = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    String monthYear = DateFormat('MMMM yyyy').format(now);
    List<DateTime> weekDates = _getWeekDates(now);

    return AppLayout(
      body: Container(
        color: Colors.white, // Set the background color of the page to white
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      minHeight: 150,
                      maxHeight: 150,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              monthYear,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                double buttonWidth =
                                    (constraints.maxWidth - 6 * 4.0) / 7;
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: weekDates.map((date) {
                                    String day = DateFormat('E').format(date);
                                    String dayNumber = date.day.toString();
                                    return _buildDateButton(
                                        date == now, day, dayNumber, buttonWidth);
                                  }).toList(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFC6DFDF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today’s Tasks',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF003F5A),
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: completedTasks / 4,
                            backgroundColor: Colors.grey[300],
                            color: Color(0xFF007A7A),
                          ),
                          SizedBox(height: 16),
                          Container(
                            height: 400, // Adjust the height as needed
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  _buildTaskCard(0, 'Drink Water',
                                      'Drink 3 litres of water today'),
                                  _buildTaskCard(
                                      1, 'Exercise', 'Do 30 minutes of exercise'),
                                  _buildTaskCard(
                                      2, 'Read', 'Read 50 pages of a book'),
                                  _buildTaskCard(
                                      3, 'Meditate', 'Meditate for 15 minutes'),
                                ],
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
          ],
        ),
      ),
      currentIndex: 2, // Set the current index for the BottomNavigationBar
    );
  }

  List<DateTime> _getWeekDates(DateTime currentDate) {
    int currentDay = currentDate.weekday;
    DateTime firstDayOfWeek =
        currentDate.subtract(Duration(days: currentDay - 1));
    return List.generate(
        7, (index) => firstDayOfWeek.add(Duration(days: index)));
  }

  Widget _buildDateButton(
      bool isSelected, String day, String date, double width) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        color: isSelected ? Colors.teal : Color(0xFFC6DFDF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(int index, String title, String description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF003F5A),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF007A7A),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!taskCompletionStatus[index]) {
                        completedTasks++;
                        taskCompletionStatus[index] = true;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: taskCompletionStatus[index]
                        ? Color(0xFF007A7A)
                        : Color(0xFFDE6600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    taskCompletionStatus[index]
                        ? 'Completed'
                        : 'Mark as Completed',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12), // Adjust font size here
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 32),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
