import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_care/screen/petsuccess.dart';
import 'package:pet_care/screen/register.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({super.key, required String title});

  @override
  _PetProfileState createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _breedEditingController = TextEditingController();
  final TextEditingController _ageEditingController = TextEditingController();
  final TextEditingController _weightEditingController =
      TextEditingController();
  final TextEditingController _hightEditingController = TextEditingController();
  final TextEditingController _genderEditingController =
      TextEditingController();
  late CollectionReference _collectionReference;

  @override
  void initState() {
    super.initState();
    _collectionReference = FirebaseFirestore.instance.collection('pet');
  }

  void _addItem() async {
    await _collectionReference.add(
      {
        'name': _nameEditingController.text,
        'breed': _breedEditingController.text,
        'age': _ageEditingController.text,
        'weight': _weightEditingController.text,
        'hight': _hightEditingController.text,
        'gender': _genderEditingController.text,
      },
    );

    _nameEditingController.clear();
    _breedEditingController.clear();
    _ageEditingController.clear();
    _weightEditingController.clear();
    _hightEditingController.clear();
    _genderEditingController.clear();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PetSuccess()),
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
              fit: BoxFit.cover,
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
                      'images/pet.png',
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
                        "Pet's Name",
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
                        hintText: "Enter Pet's Name",
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
                        "Breed",
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
                      controller: _breedEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Enter Breed',
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
                        "Age",
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
                      controller: _ageEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Enter Age',
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
                        "Weight",
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
                      controller: _weightEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Enter Weight',
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
                        "Hight",
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
                      controller: _hightEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Enter Hight',
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
                        "Grnder",
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
                      controller: _genderEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        hintText: 'Enter Gender',
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
