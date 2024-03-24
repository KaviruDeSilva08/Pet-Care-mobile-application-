import 'package:flutter/material.dart';
import 'package:pet_care/screen/dashboard.dart';
import 'package:pet_care/screen/register.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'images/mylogo.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 30),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    _signIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 18, 76, 135),
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register(
                                title: 'GFG',
                              )),
                    );
                  },
                  child: Text(
                    'Don\'t have an account? Register here',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 43, 140),
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() {
    // Check username and password
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Your authentication logic here
    if (username == 'admin' && password == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(title: 'GFG'),
        ),
      );
    } else {
      // Show error message or handle invalid credentials
    }
  }
}
