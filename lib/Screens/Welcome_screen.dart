import 'package:app/components/mybutton.dart';
import 'package:flutter/material.dart';
import "package:animated_text_kit/animated_text_kit.dart";

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: "logo",
                child: Container(
                  height: 100,
                  child: Image.asset("images/logo.jpg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: TyperAnimatedTextKit(
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(fontSize: 20),
                    speed: Duration(milliseconds: 80),
                    text: ["Welcome to our app"]),
              ),
              MyButton(
                text: "Add Student",
                handelPress: () {
                  Navigator.pushNamed(context, "add");
                },
              ),
              MyButton(
                text: "go to list",
                handelPress: () {
                  Navigator.pushNamed(context, "list");
                },
              )
            ]),
      ),
    );
  }
}
