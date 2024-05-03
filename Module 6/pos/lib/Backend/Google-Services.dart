import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pos/Screen/DashBoard/dashboard.dart';
import 'package:pos/Screen/DashBoard/login-page.dart';

class GoogleServicesClass {
  //Signin with google
  Future<void> googlesignin(BuildContext context) async {
    GoogleSignInAccount? guser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication gauth = await guser!.authentication;
    AuthCredential credential1 = GoogleAuthProvider.credential(
        accessToken: gauth.accessToken, idToken: gauth.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential1);
    User? user = userCredential.user;
    print(user!.email);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyDashboard(
            
          ),
        ));
    print(user.uid);
  }

  //Signout from Google
  Future<void> googlesignout(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => loginPage(),
        ));
  }
}
