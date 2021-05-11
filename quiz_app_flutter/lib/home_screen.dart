import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/constants.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

double xp = 0.4;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double widgetMaxWidth = MediaQuery.of(context).size.width * 0.86;
    double widgetMaxHeight = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(98, 23, 167, 6),
                Color.fromRGBO(134, 37, 180, 6)
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
          ),
          Center(
            child: Container(
              width: widgetMaxWidth,
              height: widgetMaxHeight,
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    width: widgetMaxWidth,
                    height: 180,
                    decoration: contDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(
                                value: xp,
                                strokeWidth: 6,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.deepPurple),
                              ),
                            ),
                            Container(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    fontSize: 42, color: Colors.deepPurple),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Experience Level : ",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                letterSpacing: 0.4,
                              ),
                            ),
                            Text(
                              "Novice",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                letterSpacing: 0.4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: widgetMaxWidth,
                    height: 410,
                    child: GridView.builder(
                        itemCount: 12,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(2),
                            decoration: contDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Subject",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                      letterSpacing: 0.2),
                                ),
                                Text(
                                  "Medium",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                      letterSpacing: 0.2),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
