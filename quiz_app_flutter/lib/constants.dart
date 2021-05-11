import 'package:flutter/material.dart';

BoxDecoration contDecoration() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
        BoxShadow(
            color: Colors.deepPurple,
            offset: Offset(
              2,
              2,
            ),
            blurRadius: 2)
      ]);
}
BoxDecoration backgroundDecoration(){
  return BoxDecoration(
    gradient: LinearGradient(colors: [
      Color.fromRGBO(98, 23, 167, 6),
      Color.fromRGBO(134, 37, 180, 6)
    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
  );
}
