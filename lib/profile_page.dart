import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.name, required this.email});
  final String name;
  final String email;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.24,
              color: const Color(0xff007A7A),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            const Color(0xFF007A7A), // #007A7A color
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 4.0, // Border width
                            ),
                          ),
                          child: const CircleAvatar(
                            radius:
                                46, // Radius should be slightly smaller than the outer CircleAvatar to accommodate the border
                            backgroundColor: Color(
                                0xFF003F5A), // Background color for the inner circle
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 80,
                        child: const VerticalDivider(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.name}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          Text(
                            "${widget.email}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                leading: Icon(
                  Icons.edit,
                  color: Color(0xff007A7A),
                ),
                title: Text(
                  "Edit Profile",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff003F5A)),
                ),
                subtitle: Text(
                  "Update Personal Details",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff007A7A)),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 1,
                child: Divider(
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("assets/ProfileIcons/Practitioner.png"),
                  color: Color(0xff007A7A),
                ),
                title: Text(
                  "Register as Practitioner",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff003F5A)),
                ),
                subtitle: Text(
                  "Start Practicing Now",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff007A7A)),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 1,
                child: Divider(
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("assets/ProfileIcons/Appointment.png"),
                  color: Color(0xff007A7A),
                ),
                title: Text(
                  "Your Appointments",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff003F5A)),
                ),
                subtitle: Text(
                  "View Your Appointments",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff007A7A)),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 1,
                child: Divider(
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("assets/ProfileIcons/Badge.png"),
                  color: Color(0xff007A7A),
                ),
                title: Text(
                  "Achievements and Badges",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff003F5A)),
                ),
                subtitle: Text(
                  "\$20",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff007A7A)),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 1,
                child: Divider(
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("assets/ProfileIcons/Notification.png"),
                  color: Color(0xff007A7A),
                ),
                title: Text(
                  "Notifications",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff003F5A)),
                ),
                subtitle: Text(
                  "Enable/Disable Notifications",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff007A7A)),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 1,
                child: Divider(
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("assets/ProfileIcons/Customize.png"),
                  color: Color(0xff007A7A),
                ),
                title: Text(
                  "Customization Options",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff003F5A)),
                ),
                subtitle: Text(
                  "Personalize Your Theme",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff007A7A)),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 1,
                child: Divider(
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("assets/ProfileIcons/Subscription.png"),
                  color: Color(0xff007A7A),
                ),
                title: Text(
                  "Subscription And Billing",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff003F5A)),
                ),
                subtitle: Text(
                  "Manage Subscription Plans",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff007A7A)),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 1,
                child: Divider(
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("assets/ProfileIcons/LinkedApps.png"),
                  color: Color(0xff007A7A),
                ),
                title: Text(
                  "Linked Apps",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff003F5A)),
                ),
                subtitle: Text(
                  "Sync with Calendar",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff007A7A)),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 1,
                child: Divider(
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                leading: ImageIcon(
                  AssetImage("assets/ProfileIcons/Language.png"),
                  color: Color(0xff007A7A),
                ),
                title: Text(
                  "Languages",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff003F5A)),
                ),
                subtitle: Text(
                  "Available Languages",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff007A7A)),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                height: 1,
                child: Divider(
                  color: Color.fromARGB(255, 219, 215, 215),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
