import 'dart:async'; // Import the async library for Timer
import 'package:flutter/material.dart';
import 'package:pet_care/screen/signinpage.dart';

class Loding extends StatefulWidget {
  // ignore: use_super_parameters
  const Loding({Key? key, required String title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LodingState createState() => _LodingState();
}

class _LodingState extends State<Loding> {
  double _progress = 0; // Variable to track the progress

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    // Set a timer to periodically update the progress
    Timer.periodic(const Duration(milliseconds: 300), (Timer timer) {
      if (_progress >= 1) {
        timer.cancel(); // Stop the timer when the progress is complete
        _navigateToHome(); // Navigate to the next page
      } else {
        setState(() {
          _progress += 0.1; // Increment the progress
        });
      }
    });
  }

  _navigateToHome() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SigninPage(
          title: 'GFG',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/background.jpg'), // Replace with your background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/mylogo.png',
                width: 300,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 70,
                  right: 70,
                ),
                child: LinearProgressIndicator(
                  value: _progress, // Set the value of the progress indicator
                  backgroundColor: Color.fromARGB(
                      180, 176, 194, 213), // Set the background color
                  minHeight: 15.0,
                  borderRadius: BorderRadius.circular(30),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      const Color.fromARGB(
                          255, 34, 88, 143)), // Set the progress color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
