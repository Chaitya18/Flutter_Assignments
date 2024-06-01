import 'package:budget_app/screen/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController uname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  String current = "";
  bool _isLoading = false;
  Future<void> signup() async {
    final UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: uname.text.toString(), password: password.text.toString());
    User? user = userCredential.user;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid)
        .set({'name': '${name.text.toString()}'});

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyDashboard(
            user: user,
          ),
        ));
  }

  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: uname.text.toString(), password: password.text.toString());
    User? user = userCredential.user;
    setState(() {
      _isLoading = false;
    });
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyDashboard(
            user: user,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.red, Colors.green, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: uname,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  _isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
