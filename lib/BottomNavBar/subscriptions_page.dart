import 'package:flutter/material.dart';
import '../app_layout.dart'; // Import the AppLayout

class SubscriptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 40.0, top: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Subscription Plans',
                  style: TextStyle(
                    color: Color(0xFF003F5A),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: PageController(viewportFraction: 0.85),
                children: [
                  _buildSubscriptionPlan(
                    context,
                    'Basic Plan',
                    '₹ 129 / month',
                    [
                      '6 sessions per month',
                      'Full access to specialists',
                      '24/7 on-demand support',
                      'Personalized therapy plans',
                      'Advanced progress reports',
                      'Premium mental health resources',
                      'Wellness activities and exercises',
                    ],
                  ),
                  _buildSubscriptionPlan(
                    context,
                    'Standard Plan',
                    '₹ 199 / month',
                    [
                      '12 sessions per month',
                      'Full access to specialists',
                      '24/7 on-demand support',
                      'Personalized therapy plans',
                      'Advanced progress reports',
                      'Premium mental health resources',
                      'Wellness activities and exercises',
                      'Monthly webinars',
                    ],
                  ),
                  _buildSubscriptionPlan(
                    context,
                    'Premium Plan',
                    '₹ 299 / month',
                    [
                      'Unlimited sessions per month',
                      'Full access to specialists',
                      '24/7 on-demand support',
                      'Personalized therapy plans',
                      'Advanced progress reports',
                      'Premium mental health resources',
                      'Wellness activities and exercises',
                      'Monthly webinars',
                      'One-on-one coaching',
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      currentIndex: 3, // Set the current index for the BottomNavigationBar
    );
  }

  Widget _buildSubscriptionPlan(
      BuildContext context, String title, String price, List<String> benefits) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        width: 333,
        height: 700, // Increased height
        decoration: BoxDecoration(
          color: Color(0x63C6DFDF), // 39% opacity
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0x63C6DFDF)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF003F5A),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 8),
              Text(
                price,
                style: TextStyle(
                  color: Color(0xFF007A7A),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 285,
                height: 1,
                color: Color(0xFF007A7A),
              ),
              SizedBox(height: 16), // Increased margin
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: benefits
                    .map(
                      (benefit) => Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16.0,
                            left:
                                16.0), // Added left margin and increased bottom margin
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Color(0xFF007A7A),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                benefit,
                                style: TextStyle(
                                  color: Color(0xFF007A7A),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle select plan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDE6600),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: Size(258, 40),
                  ),
                  child: Text(
                    'SELECT PLAN',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'Terms Apply',
                  style: TextStyle(
                    color: Color(0xFF007A7A),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
