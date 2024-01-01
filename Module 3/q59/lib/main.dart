import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login and Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController upassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void navigateToRegistrationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  void performLogin() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      String email = username.text;
      String password = upassword.text;

      // Example: Check credentials (replace with your authentication logic)
      if (email == "chaitya" && password == "123") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegistrationScreen()));
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
                decoration: InputDecoration(labelText: 'upassword'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your upassword';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: performLogin,
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: navigateToRegistrationScreen,
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
      if (upassword == confirmupassword) {
        // Successful registration, navigate to home or dashboard
        // For now, just print a message
        print("Registration successful!");
      } else {
        // upasswords don't match, show an error message
        print("upasswords do not match");
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
                decoration: InputDecoration(labelText: 'upassword'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your upassword';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: confirmupassword,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm upassword'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your upassword';
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
