import 'package:flutter/material.dart';

class personalInfo extends StatefulWidget {
  const personalInfo({super.key});

  @override
  State<personalInfo> createState() => _personalInfoState();
}

class _personalInfoState extends State<personalInfo> {
  TextStyle label() {
    return TextStyle(
        fontSize: 16, color: Color(0xff003F5A), fontWeight: FontWeight.w700);
  }

  TextStyle HintText() {
    return TextStyle(
        fontSize: 16,
        color: Color(0xff003F5A).withOpacity(0.29),
        fontWeight: FontWeight.w400);
  }

  Container field(String hintText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextFormField(
        style: HintText(),
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(color: Colors.white, width: 1))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal Information",
            style: TextStyle(
                color: Color(0xff007A7A),
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20),
          Text(
            "Name",
            style: label(),
          ),
          SizedBox(height: 10),
          field("Name"),
          SizedBox(height: 20),
          Text(
            "Mobile Number",
            style: label(),
          ),
          SizedBox(height: 10),
          field("Mobile Number"),
          SizedBox(height: 20),
          Text(
            "Email",
            style: label(),
          ),
          SizedBox(height: 10),
          field("Email"),
          SizedBox(height: 20),
          Text(
            "Aadhar Number",
            style: label(),
          ),
          SizedBox(height: 10),
          field("Aadhar Number"),
          SizedBox(height: 25),
          Text(
            "Address Information",
            style: TextStyle(
                color: Color(0xff007A7A),
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20),
          Text(
            "Residence Address",
            style: label(),
          ),
          SizedBox(height: 10),
          field("Residence Address"),
          SizedBox(height: 20),
          Text(
            "Pincode",
            style: label(),
          ),
          SizedBox(height: 10),
          field("Pincode"),
          SizedBox(height: 20),
          Text(
            "Upload Your Certificates",
            style: TextStyle(
                color: Color(0xff007A7A),
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ));
  }
}
