import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({super.key});

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover, // You can adjust the image fit as needed
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 300.0),
                TextField(
                  controller: _nameEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _breedEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Breed',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _ageEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Age',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _weightEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Weight',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _hightEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Hight',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _genderEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Gender',
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

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
