import 'dart:convert';

import 'package:app/Screens/Student.dart';
import 'package:http/http.dart' as http;

class API {
  AddStudent(Student std) async {
    Uri path = Uri.https("api.mohamed-sadek.com", "/Student/POST");
    http.Response res = await http.post(path,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          "FirstName": std.FirstName,
          "LastName": std.LastName,
          "Mobile": std.Mobile,
          "Email": std.Email,
          "NationalID": std.NationalID,
          "Age": std.Age
        }));
    print(res.body);
  }
}
