import 'package:app/API.dart';
import 'package:app/Screens/Student.dart';
import 'package:app/components/mybutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  Student std = Student();
  final form = GlobalKey<FormState>();
  API api = API();
  SaveForm() async {
    if (form.currentState?.validate() == false) {
      return;
    } else {
      form.currentState?.save();
      //await api.AddStudent(std);
      FirebaseFirestore.instance.collection("Student").add({
        "FirstName": std.FirstName,
        "LastName": std.LastName,
        "Mobile": std.Mobile,
        "Email": std.Email,
        "NationalID": std.NationalID,
        "Age": std.Age
      });
      Navigator.pushNamed(context, "list");
    }
    print(std.FirstName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
            key: form,
            child: ListView(
              children: [
                Hero(
                  tag: "logo",
                  child: Container(
                    height: 300,
                    child: Image.asset("images/logo.jpg"),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Enter your Frist Name"),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    std.FirstName = newValue!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Enter your Last Name"),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    std.LastName = newValue!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Enter your National ID"),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    std.NationalID = newValue!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Enter your Email"),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    std.Email = newValue!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Enter your Mobile"),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    std.Mobile = newValue!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Enter your age"),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    std.Age = int.parse(newValue!);
                  },
                  validator: (value) {
                    if (int.tryParse(value!) == null) {
                      return "not number";
                    } else {
                      return null;
                    }
                  },
                ),
                MyButton(text: "Save", handelPress: SaveForm)
              ],
            )),
      )),
    );
  }
}
