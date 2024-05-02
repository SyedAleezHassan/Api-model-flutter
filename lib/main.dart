import 'package:covid_track_app/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 133, 156),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 211, 209),
          title: Text(
            "Data Fetch Using Model",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}

//@@@@@@@@@
