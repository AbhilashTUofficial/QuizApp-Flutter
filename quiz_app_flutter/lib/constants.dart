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
