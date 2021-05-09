import 'package:flutter/material.dart';

import 'Widgets/app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(237, 243, 246, 1),
      appBar: CustomAppBar(),
    );
  }
}
