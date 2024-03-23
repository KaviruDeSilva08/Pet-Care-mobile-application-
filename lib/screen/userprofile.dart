import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_care/screen/register.dart';
import 'package:pet_care/screen/usersuccess.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required String title});

  @override
  // ignore: library_private_types_in_public_api
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

    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const UserSuccess()),
    );
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
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.man,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
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
                            left: 25, bottom: 8.0, top: 8.0),
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
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
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
                            left: 25, bottom: 8.0, top: 8.0),
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
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
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
                            left: 25, bottom: 8.0, top: 8.0),
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
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
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
                            left: 25, bottom: 8.0, top: 8.0),
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
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
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
                            left: 25.0, bottom: 8.0, top: 8.0),
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
