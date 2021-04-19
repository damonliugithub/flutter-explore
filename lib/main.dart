import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_explore/dart_playground/hooks/index.dart';
import 'package:flutter_explore/dart_playground/hooks/rotation_transition.dart';
import 'package:flutter_explore/dart_playground/words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Bar")),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            children: [
              NavigatorButton(EnglishWordsApp(), 'English Words'),
              NavigatorButton(AnimationIndex(), 'Animation Demo'),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigatorButton extends StatelessWidget {
  final Widget target;
  final String name;

  NavigatorButton(this.target, this.name);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => this.target),
        );
      },
      child: Text(this.name),
    );
  }
}
