import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz app',
      theme: ThemeData(
        fontFamily: 'lobster',
      ),
      debugShowCheckedModeBanner: false,

      home: Home(),
    );
  }
}