import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentalheathstartup/login_page.dart';
import 'package:pinput/pinput.dart';
import 'package:mentalheathstartup/constants/color.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPState();
}

class _OTPState extends State<OTPScreen> {
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  var otp = "";
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          backgroundColor: Colors.white,
          // color: Colors.white,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 198, 223, 223)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    );
    return Scaffold(
        backgroundColor: AppColor.darkBlue, // Background color
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        // color: Colors.white,
                        border:
                            Border.all(color: AppColor.darkGreen, width: 1)),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: AppColor.darkGreen, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
                    decoration: BoxDecoration(
                      color: AppColor.opaqueBlue, // Container color
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'OTP Verification',
                          style: TextStyle(
                            color: AppColor.darkBlue,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Enter the OTP sent to ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.darkBlue,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "+91 xxxxxx068",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.darkBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Pinput(
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          keyboardType: TextInputType.number,
                          showCursor: true,
                          onChanged: (pin) {
                            otp = pin;
                          },
                        ),
                        SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't Receive the OTP?",
                              style: TextStyle(
                                color: AppColor.darkBlue,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "RESEND OTP",
                              style: TextStyle(
                                color: AppColor.darkGreen,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: LoginScreen.verify,
                                      smsCode: otp);

                              // Sign the user in (or link) with the credential
                              await auth.signInWithCredential(credential);

                              Navigator.pushNamed(context, "/home");
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: AppColor.darkOrange,
                            // primary: Color(0xFFD4802A), // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Center(
                            child: Text(
                              'VERIFY & PROCEED',
                              style: TextStyle(fontSize: 16),
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
        ));
  }
}