// ignore_for_file: use_super_parameters, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ViewUser extends StatelessWidget {
  final String title;

  const ViewUser({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('User Profile'),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
        backgroundColor: Colors.white, // Change color as needed
        elevation: 0, // Remove app bar elevation
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'images/icon.png', // Path to your logo image
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/background.jpg'), // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/user.png'),
                radius: 50.0,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User Name:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Ms. Kariyawasam',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              // Add more user information rows
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Sign out functionality
                    },
                    child: Text('Sign out'),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProfile(
                                  title: 'GFG',
                                )),
                      );
                      // Sign in functionality (optional)
                    },
                    child: Text('Sign in'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
