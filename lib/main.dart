import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        appBar: AppBar(title: Text("App Bar")),
        body: Center(
          child: Text("Body-Center"),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
