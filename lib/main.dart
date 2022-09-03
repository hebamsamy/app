import 'package:app/Screens/Welcome_screen.dart';
import 'package:app/Screens/add_student_screen.dart';
import 'package:app/Screens/list_student_screen.dart';
import 'package:app/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, db) {
          if (db.connectionState == ConnectionState.done) {
            return WelcomeScreen();
          } else {
            return Loader(color: Colors.white);
          }
        },
      ),
      routes: {
        "add": (context) => AddStudentScreen(),
        "list": (context) => StudentListScreen()
      },
    );
  }
}
