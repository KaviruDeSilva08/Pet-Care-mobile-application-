// ignore_for_file: unused_import

import 'dart:async'; // Import the async library for Timer
import 'package:flutter/material.dart';
import 'package:furfriend/Splash.dart';
import 'main.dart';

class Loding extends StatefulWidget {
  const Loding({Key? key, required String title}) : super(key: key);

  @override
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
        builder: (context) => const MyHomePage(
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
                'assets/background.jpg'), // Replace with your background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo .png',
                width: 300,
                height: 300,
              ),
              SizedBox(
                  height:
                      10), // Add some space between the logo and the loading bar
              LinearProgressIndicator(
                value: _progress, // Set the value of the progress indicator
                backgroundColor: Color.fromARGB(
                    180, 176, 194, 213), // Set the background color
                minHeight: 15.0,
                valueColor: AlwaysStoppedAnimation<Color>(const Color.fromARGB(
                    255, 34, 88, 143)), // Set the progress color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
