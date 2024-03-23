import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_care/screen/register.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _numberEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _cpasswordEditingController =
      TextEditingController();
  late CollectionReference _collectionReference;

  @override
  void initState() {
    super.initState();
    _collectionReference = FirebaseFirestore.instance.collection('user');
  }

  void _addItem() async {
    await _collectionReference.add(
      {
        'name': _nameEditingController.text,
        'email': _emailEditingController.text,
        'number': _numberEditingController.text,
        'password': _passwordEditingController.text,
        'cpassword': _cpasswordEditingController.text,
      },
    );

    _nameEditingController.clear();
    _emailEditingController.clear();
    _numberEditingController.clear();
    _passwordEditingController.clear();
    _cpasswordEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover, // You can adjust the image fit as needed
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register(
                                      title: 'GFG',
                                    )),
                          );
                        },
                        child: Icon(
                          size: 30,
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/mylogo.png',
                      width: 220,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/user.png',
                      width: 150,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.man,
                        color: Colors.white,
                      ),
                      Text(
                        "User Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      controller: _nameEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Enter User Name',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.man,
                        color: Colors.white,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      controller: _emailEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Enter Email',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.man,
                        color: Colors.white,
                      ),
                      Text(
                        "Telephone Number",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      controller: _numberEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Enter Telephone Number',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.man,
                        color: Colors.white,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      controller: _passwordEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Enter Password',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.man,
                        color: Colors.white,
                      ),
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      controller: _cpasswordEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Confirm Your Password',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                //
                //
                // SizedBox(height: 20.0),
                // TextField(
                //   controller: _emailEditingController,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Email',
                //   ),
                // ),
                // SizedBox(height: 20.0),
                // TextField(
                //   controller: _numberEditingController,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Number',
                //   ),
                // ),
                // SizedBox(height: 20.0),
                // TextField(
                //   controller: _passwordEditingController,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Password',
                //   ),
                // ),
                // SizedBox(height: 20.0),
                // TextField(
                //   controller: _cpasswordEditingController,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'C Password',
                //   ),
                // ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 18, 76, 135),
                  ),
                  onPressed: _addItem,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
