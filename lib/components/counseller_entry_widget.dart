import 'package:flutter/material.dart';

class CounsellorEntry extends StatelessWidget {
  final String name;
  final int experience;
  final double rating;
  final int reviews;
  final double pricePerMinute;

  CounsellorEntry({
    required this.name,
    required this.experience,
    required this.rating,
    required this.reviews,
    required this.pricePerMinute,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 30,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text("$experience years experience"),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Text("$rating ($reviews reviews)"),
                    ],
                  ),
                  Text("Billed @ ₹$pricePerMinute/min"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                // primary: Colors.orange
                ),
              child: Text("Make Appointment"),
            ),
          ],
        ),
      ),
    );
  }
}
