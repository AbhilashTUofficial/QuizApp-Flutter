import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:quiz_app_flutter/constants.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String quiz;
  Future initState()async{
      super.initState();
      var dio = Dio();
      Response response = await dio.get('https://opentdb.com/api.php?amount=10');
      print(response.data);

  }
  @override
  Widget build(BuildContext context) {
    double widgetMaxWidth = MediaQuery.of(context).size.width * 0.86;
    double widgetMaxHeight = MediaQuery.of(context).size.height * 0.86;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: backgroundDecoration(),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: widgetMaxWidth,
              height: widgetMaxHeight,
              decoration: contDecoration(),
              child: quiz==null?Container(
                width: 200,height: 200,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.deepPurple),
                ),
              ):Text("ready"),
            ),
          )
        ],
      ),
    );
  }
}
