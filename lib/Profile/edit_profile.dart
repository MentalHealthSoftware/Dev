import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentalheathstartup/Profile/profile_page.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  bool _isObscure = true; // Controls the visibility of the password

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      setState(() {
        _imageFile = null;
      });
    }
  }

  void _showImageSourceSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 24),
              ),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          _imageFile != null ? FileImage(_imageFile!) : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _showImageSourceSelection(context),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xff007A7A),
                          child: Image.asset(
                            'assets/ProfileIcons/Edit.png',
                            color: Colors.white,
                            height: 24.5,
                            width: 24.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "Full Name",
                style: TextStyle(
                    color: Color(0xffB5B5B5),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),
              TextFormField(
                controller: c1,
                cursorColor: const Color(0xff003F5A),
                style: const TextStyle(
                    color: Color(0xff003F5A),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins"),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD9D9D9))),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                "E-mail",
                style: TextStyle(
                    color: Color(0xffB5B5B5),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),
              TextFormField(
                controller: c2,
                cursorColor: const Color(0xff003F5A),
                style: const TextStyle(
                    color: Color(0xff003F5A),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins"),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD9D9D9))),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                "Password",
                style: TextStyle(
                    color: Color(0xffB5B5B5),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),
              TextFormField(
                controller: c3,
                obscureText: _isObscure,
                cursorColor: const Color(0xff003F5A),
                style: const TextStyle(
                    color: Color(0xff003F5A),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins"),
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD9D9D9))),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: Icon(
                      _isObscure
                          ? Icons.visibility_off
                          : Icons.visibility, // Toggle icon
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                "Phone",
                style: TextStyle(
                    color: Color(0xffB5B5B5),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),
              TextFormField(
                controller: c4,
                cursorColor: const Color(0xff003F5A),
                style: const TextStyle(
                    color: Color(0xff003F5A),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins"),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD9D9D9))),
                ),
              ),
              SizedBox(
                height: 108,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 23.0, bottom: 10),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size(152, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          side: BorderSide(color: Color(0xffb5b5b5))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xffDE6600),
                          fixedSize: Size(152, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          side: BorderSide.none),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProfilePage(
                                      name: c1.text != '' ? c1.text : "Name",
                                      email: c2.text != '' ? c2.text : "Email",
                                      avatar: _imageFile,
                                    )),
                            (route) => false);
                      },
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
