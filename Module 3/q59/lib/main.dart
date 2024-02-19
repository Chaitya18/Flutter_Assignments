// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login and Registration Form',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController upassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void registrationpage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  void loginPage() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      String email = username.text;
      String password = upassword.text;

      if (email == "chaitya" && password == "123") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginDetails()));
      } else {
        print("Invalid credentials");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: username,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: upassword,
                obscureText: true,
                decoration: InputDecoration(labelText: 'password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: loginPage,
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: registrationpage,
                child: Text('Create an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController upassword = TextEditingController();
  TextEditingController confirmupassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void performRegistration() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic here
      String email = username.text;
      String password = upassword.text;
      String confirmupassword = upassword.text;

      // Example: Check if upasswords match (replace with your registration logic)
      if (password == confirmupassword) {
        print("Registration successful!");
      } else {
        // upasswords don't match, show an error message
        print("passwords do not match");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: username,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: upassword,
                obscureText: true,
                decoration: InputDecoration(labelText: 'password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: confirmupassword,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: performRegistration,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginDetails extends StatelessWidget {
  const LoginDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Text("Username : Chaitya"), Text("Password : 123")],
        ),
      ),
    );
  }
}
