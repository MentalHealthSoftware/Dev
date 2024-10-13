import 'package:flutter/material.dart';
import 'package:mentalheathstartup/IntroPages(3)/LinearProgress.dart';

class registerAs extends StatefulWidget {
  final GlobalKey<LinearProgressState> linearProgressKey;

  const registerAs({super.key, required this.linearProgressKey});

  @override
  State<registerAs> createState() => _registerAsState();
}

class _registerAsState extends State<registerAs> {
  String _selectedOption = 'Counsellor';
  final List<String> options = ['Counsellor', 'Psychiatrists', 'Therapist'];

  Widget _buildOptionTile(String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: _selectedOption == option
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
          trailing: Radio(
            value: option,
            groupValue: _selectedOption,
            activeColor: Color(0xff003F5A),
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value!;
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
              "Please note:certificates would be required",
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
                    borderRadius:
                        BorderRadius.circular(8), // Adjust the radius as needed
                  ),
                ),
                onPressed: () {
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
