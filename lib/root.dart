import 'package:flutter/material.dart';
import 'package:vaccinepassport/db.dart';
import 'package:vaccinepassport/register.dart';
import 'package:vaccinepassport/show.dart';

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  initState() {
    super.initState();
  }

  var btnColor = Color(0xFF52ccc2);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final adjustsizeh = MediaQuery.of(context).size.height * 0.0011;

    return Scaffold(
        body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Container(
            padding: const EdgeInsets.all(3),
            margin: EdgeInsets.all(10),
            child: Image.asset('assets/Logo.jpg', fit: BoxFit.contain),
            height: screenHeight / 2.6,
            width: screenWidth * 1.3,
          ),
          Container(
              height: screenHeight / 2,
              padding: const EdgeInsets.all(3),
              margin: EdgeInsets.all(10),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                      margin: EdgeInsets.all(4),
                      child: SizedBox(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.7,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Show()));
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: btnColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.1),
                              )),
                          child: Text(
                            "パスポートを表示",
                            style: TextStyle(
                              fontSize: 20 * adjustsizeh,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                      margin: EdgeInsets.all(4),
                      child: SizedBox(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.7,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: btnColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.1),
                              )),
                          child: Text(
                            "情報を登録",
                            style: TextStyle(
                              fontSize: 20 * adjustsizeh,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]))
        ]));
  }
}
