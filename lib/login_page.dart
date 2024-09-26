import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalheathstartup/constants/color.dart';
import 'package:mentalheathstartup/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String verify = "";
  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController countryController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkBlue, // Background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
            decoration: BoxDecoration(
              color: AppColor.opaqueBlue, // Container color
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text('logo'),
                ),
                SizedBox(height: 20),
                Text(
                  'Create an account',
                  style: TextStyle(
                    color: AppColor.darkBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter your mobile number to sign up/login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.darkBlue,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countryController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextField(
                        controller: numberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Mobile Number",
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    //To block reCAPCHA, after publishing app on play store

                    // await FirebaseAuth.instance
                    //     .setSettings(appVerificationDisabledForTesting: true);

                    // await FirebaseAuth.instance.verifyPhoneNumber(
                    //   phoneNumber:
                    //       '${countryController.text + numberController.text}',
                    //   verificationCompleted:
                    //       (PhoneAuthCredential credential) {},
                    //   verificationFailed: (FirebaseAuthException e) {},
                    //   codeSent: (String verificationId, int? resendToken) {
                    //     LoginScreen.verify = verificationId;
                    Navigator.pushNamed(context, "/home");
                  },
                  //     codeAutoRetrievalTimeout: (String verificationId) {},
                  //   );
                  // },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.darkOrange,
                    foregroundColor: Colors.white, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Center(
                    child: Text(
                      'Get OTP',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
