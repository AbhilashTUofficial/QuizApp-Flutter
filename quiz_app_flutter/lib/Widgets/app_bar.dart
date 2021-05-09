import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
            color: Color.fromRGBO(42, 43, 49, 1),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 100,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 100,
            decoration: BoxDecoration(color: Colors.white),
          ),
        )
      ],),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}
