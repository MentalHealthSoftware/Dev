import 'package:flutter/material.dart';
import 'package:mentalheathstartup/Profile/RegisterAsPractitioner/LinearProgress.dart';

class RegisterAs extends StatefulWidget {
  final GlobalKey<LinearProgressState> linearProgressKey;

  const RegisterAs({super.key, required this.linearProgressKey});

  @override
  State<RegisterAs> createState() => _RegisterAsState();
}

class _RegisterAsState extends State<RegisterAs> {
  final List<String> options = ['Counsellor', 'Psychiatrists', 'Therapist'];
  final Set<String> _selectedOptions = {};

  Widget _buildOptionTile(String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: _selectedOptions.contains(option)
              ? Border.all(color: Color(0xff003F5A), width: 1)
              : null,
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(
            option,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff003F5A),
            ),
          ),
          trailing: Checkbox(
            value: _selectedOptions.contains(option),
            activeColor: Color(0xff003F5A),
            onChanged: (bool? selected) {
              setState(() {
                if (selected == true) {
                  _selectedOptions.add(option);
                } else {
                  _selectedOptions.remove(option);
                }
              });
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 204, 240, 188),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Ready to Make a Difference!',
              style: TextStyle(
                  color: Color(0xff003F5A),
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            Text(
              'What do you want to register as?',
              style: TextStyle(
                  color: Color(0xff007A7A),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            for (var option in options)
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5),
                child: _buildOptionTile(option),
              ),
            Text(
              "Please note: certificates would be required",
              style: TextStyle(
                  color: Color(0xff007A7A),
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.4,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xffDE6600),
                  side: BorderSide.none,
                  fixedSize: Size(235, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Perform action based on _selectedOptions
                  widget.linearProgressKey.currentState!.nextPage();
                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    );
  }
}
