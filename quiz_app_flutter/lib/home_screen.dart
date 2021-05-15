import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/constants.dart';
import 'package:quiz_app_flutter/quiz_info_model.dart';

import 'loading_screen.dart';

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
    double widgetMaxHeight = MediaQuery.of(context).size.height * 0.86;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: backgroundDecoration(),
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
                                    fontFamily: 'lobster',
                                    fontSize: 42,
                                    color: Colors.deepPurple),
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
                    height: 460,
                    child: GridView.builder(
                        itemCount: quizInfo.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: contDecoration(),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    quizInfo[index].category,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple,
                                        letterSpacing: 0.2),
                                  ),
                                  Text(
                                    quizInfo[index].difficult,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                        letterSpacing: 0.2),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Loading()),
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
