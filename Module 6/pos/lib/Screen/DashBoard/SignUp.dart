// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pos/Frontend/UX/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  Future<void> RegisterUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: username.text.toString(),
      password: password.text.toString(),
    );
    User? user = userCredential.user;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid)
        .set({"name": name});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: (258),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF8E24AA), Color(0xFFFB8C00)])),
                ),
                Container(
                  height: 473,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 605,
                    width: 405,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 129, 125, 125)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 12, left: 12, right: 12),
                          child: TextField(
                            controller: username,
                            decoration: InputDecoration(
                              hintText: "abc@gmail.com",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 12),
                          child: TextField(
                            controller: password,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 12),
                          child: TextField(
                            controller: cpassword,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 12, left: 12, right: 12),
                          child: TextField(
                            controller: name,
                            decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              if (password.text.toString() ==
                                  cpassword.text.toString()) {
                                if (password.text.toString().length < 6) {
                                  print(
                                      "Password Should be of at,least 6 letters");
                                }
                                if (username.text.toString() == "" ||
                                    password.text.toString() == "" ||
                                    cpassword.text.toString() == "" ||
                                    name.text.toString() == "") {
                                  Fluttertoast();
                                } else {
                                  RegisterUser();
                                  showDialog(
                                    context: context,
                                    builder: (context) => SizedBox(
                                      child: AlertDialog(
                                        title: Column(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  "assets/gifs/done.gif"),
                                              height: 150,
                                              width: 150,
                                              fit: BoxFit.contain,
                                            ),
                                            Center(
                                                child: Text(
                                              "User Registered Successfully",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                          ],
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: Text("Login"))
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                print("Not Working");
                              }
                            },
                            child: Container(
                              height: 43,
                              width: 315,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF8E24AA),
                                    Color(0xFFFB8C00)
                                  ])),
                              child: Center(
                                  child: Text(
                                "Sign-Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Text(
                            "Or Sign Up with Social Account",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                child: Container(
                              margin: EdgeInsets.all(12),
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                "assets/logos/fb.jpeg",
                                fit: BoxFit.contain,
                              ),
                            )),
                            GestureDetector(
                                child: ClipOval(
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  "assets/logos/twitter.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )),
                            GestureDetector(
                                child: Container(
                              margin: EdgeInsets.all(12),
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                "assets/logos/google.png",
                                fit: BoxFit.contain,
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
