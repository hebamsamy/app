import 'package:app/components/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Student").snapshots(),
        builder: ((context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Hero(
                  tag: "logo",
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/logo.jpg"),
                  ),
                ),
              ],
            ),
            body: (snapshot.connectionState == ConnectionState.waiting)
                ? Loader(color: Colors.black)
                : ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text(snapshot.data?.docs[index].id ?? ""),
                      title: Text(
                          "${snapshot.data?.docs[index]["FirstName"]} ${snapshot.data?.docs[index]["LastName"]}"),
                      subtitle: Text("${snapshot.data?.docs[index]["Email"]}"),
                    ),
                  ),
          );
        }));
  }
}
