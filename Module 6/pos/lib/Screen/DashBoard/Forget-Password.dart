// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyForgetPassword extends StatefulWidget {
  const MyForgetPassword({super.key});

  @override
  State<MyForgetPassword> createState() => _MyForgetPasswordState();
}

class _MyForgetPasswordState extends State<MyForgetPassword> {
  TextEditingController username = TextEditingController();
  bool? fpassword = false;
  Future<void> forget_password() async {
    setState(() {
      fpassword = true;
    });
    await Future.delayed(Duration(seconds: 2));
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: username.text.toString());
    showDialog(
      context: context,
      builder: (context) => SizedBox(
          child: AlertDialog(
        actions: [
          Text(
              "An Password reset request has been sent to your provided Username/Email-Address Please check your inbox "),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                fpassword = false;
              });
            },
            child: Text("Ok"),
          )
        ],
      )),
    );

    setState(() {
      username.text = "";
      fpassword = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 258,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF8E24AA), Color(0xFFFB8C00)])),
                ),
                Container(
                  height: 473,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(179, 239, 237, 237),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 380,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Container(
                    width: 405,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            "Forgot Password",
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
                              hintText: "Username",
                              labelText: "Username",
                              labelStyle: TextStyle(
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
                        ElevatedButton(
                            onPressed: () {
                              forget_password();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
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
                                    child: fpassword == false
                                        ? Text(
                                            "Reset Email",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          )
                                        : CircularProgressIndicator(
                                            color: Colors.white,
                                          )))),
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 25,
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
