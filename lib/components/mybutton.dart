import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback handelPress;
  String text;
  MyButton({required this.text, required this.handelPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: RawMaterialButton(
        onPressed: handelPress,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
            side: BorderSide(color: Colors.black)),
        child: Text(text),
      ),
    );
  }
}
