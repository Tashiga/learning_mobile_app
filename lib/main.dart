import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  void addData() {
    FirebaseFirestore.instance.collection('users').add({
      'name': 'Alice',
      'age': 9,
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firestore Test'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Bienvenue dans Flutter !',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.blue,
                height: 100,
                width: double.infinity,
                child: Center(child: Text('Un container', style: TextStyle(color: Colors.white))),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addData();
                  print('Bouton pressé');
                },
                child: Text('Ajouter des données'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}