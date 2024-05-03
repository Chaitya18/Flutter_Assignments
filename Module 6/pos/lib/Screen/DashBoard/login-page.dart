// ignore_for_file: unnecessary_null_comparison, must_be_immutable, camel_case_types, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos/Backend/Google-Services.dart';
import 'package:pos/Screen/DashBoard/Forget-Password.dart';
import 'package:pos/Screen/DashBoard/SignUp.dart';
import 'package:pos/Screen/DashBoard/dashboard.dart';
import 'package:pos/Frontend/UX/textField.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool signin = false;
  bool show_password = true;
  String name = "";
  GoogleServicesClass google_services = GoogleServicesClass();
  String? user;
  //Login Process
  Future<void> Login(BuildContext context) async {
    setState(() {
      signin = true;
    });
    for (int i = 0; i <= 10; i++) {}
    if (password.text.toString() == "" || username.text.toString() == "") {
      setState(() {
        signin = false;
      });
      final snackBar = SnackBar(
        content: const Text('Please enter Username and password'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: username.text.toString(),
            password: password.text.toString());
    User? user = userCredential.user;
    String a = user!.uid;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyDashboard(user1: user),
      ),
    );
    setState(() {
      a = user.uid;
      signin = false;
    });
  }

//Google Signin

//Google signout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: ((MediaQuery.of(context).size.height) * 35) / 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF8E24AA), Color(0xFFFB8C00)])),
                  ),
                  Container(
                    height: ((MediaQuery.of(context).size.height) * 62) / 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(179, 239, 237, 237),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      //height: 557+20,
                      width: 405,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Image.asset(
                            "assets/logos/logo.png",
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 12, left: 12, right: 12),
                              child:
                                  textField(username, "Username", "Username")),
                          Padding(
                              padding: const EdgeInsets.all(12),
                              child: textField_withIcon(
                                  password,
                                  "Password",
                                  "Password",
                                  show_password,
                                  (show_password == true)
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility), () {
                                if (show_password == false) {
                                  setState(() {
                                    show_password = true;
                                  });
                                } else {
                                  setState(() {
                                    show_password = false;
                                  });
                                }
                              })),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: ListTile(
                              trailing: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyForgetPassword(),
                                      ));
                                },
                                child: Text(
                                  "Forget Your password?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Login(context);
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
                                      child: signin == false
                                          ? Text(
                                              "Login",
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
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                "Or Login with Social Account",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
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
                                ),
                                onTap: () =>
                                    google_services.googlesignin(context),
                              ),
                            ],
                          ),
                          GestureDetector(
                              child: Container(
                                child: Text("New User? Sign Up"),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpPage(),
                                    ));
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
