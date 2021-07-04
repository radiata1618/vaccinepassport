import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import 'db.dart';

class Show extends StatefulWidget {
  Show({Key key}) : super(key: key);

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  initState() {
    super.initState();
  }

  bool initialDataRead = false;
  String qrText = "";
  String name = "";
  String date1 = "";
  String date2 = "";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final adjustsizeh = MediaQuery.of(context).size.height * 0.0011;
    const double horizontalPadding = 30.0;
    const double verticalmargin = 3;
    var btnColor = Color(0xFF52ccc2);

    MyDatabase db = MyDatabase();

    if (initialDataRead == false) {
      loadAsset(db);
    }
    return Scaffold(
        body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              padding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: horizontalPadding),
              height: screenHeight / 20 + (screenHeight / 20),
              child: Align(
                  alignment: Alignment.center,
                  child: Text("Vaccination Certificate",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30 * adjustsizeh,
                      )))),
          initialDataRead == false
              ? Center(child: Text(""))
              : Center(
                  child: QrImage(
                    data: qrText,
                    size: screenWidth / 1.7,
                  ),
                ),
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: verticalmargin, horizontal: horizontalPadding),
              height: screenHeight / 20,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20 * adjustsizeh,
                      )))),
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: verticalmargin, horizontal: horizontalPadding),
              height: screenHeight / 20,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25 * adjustsizeh,
                      )))),
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: verticalmargin, horizontal: horizontalPadding),
              height: screenHeight / 20,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Dose1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20 * adjustsizeh,
                      )))),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: verticalmargin,
                horizontal: horizontalPadding),
            child: Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: screenHeight / 20,
                      child: Text("Pfizer-BioNtech",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25 * adjustsizeh,
                          ))),
                  Container(
                      height: screenHeight / 20,
                      child: Text(date1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25 * adjustsizeh,
                          ))),
                ]),
          ),
              Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: verticalmargin, horizontal: horizontalPadding),
                  height: screenHeight / 20,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Dose2",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20 * adjustsizeh,
                          )))),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: verticalmargin,
                    horizontal: horizontalPadding),
                child: Row(
                  //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: screenHeight / 20,
                          child: Text("Pfizer-BioNtech",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25 * adjustsizeh,
                              ))),
                      Container(
                          height: screenHeight / 20,
                          child: Text(date2,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25 * adjustsizeh,
                              ))),
                    ]),
              ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
            margin: EdgeInsets.all(20),
            child: SizedBox(
              height: screenHeight * 0.07,
              width: screenWidth * 0.7,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: btnColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.1),
                    )),
                child: Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 20 * adjustsizeh,
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

  Future<void> loadAsset(MyDatabase db) async {
    List<Parameter> pList = await db.selectAllParametersOrderByNumber();
    for (var parameter in pList) {
      qrText += parameter.code+":"+parameter.textValue+";";
      if (parameter.code == "familyName") {
        print(parameter.textValue);
        name += parameter.textValue;
      } else if (parameter.code == "givenName") {
        print(parameter.textValue);
        name += " " + parameter.textValue;
      } else if (parameter.code == "date1") {
        date1 = parameter.textValue;
      } else if (parameter.code == "date2") {
        date2 = parameter.textValue;
      }


    }

    qrText += "vaccine1:Pfizer-BioNtech;";
    qrText += "vaccine2:Pfizer-BioNtech;";

    setState(() {
      initialDataRead = true;
    });
  }
}
