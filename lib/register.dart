import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _textControllerFamilyName = TextEditingController();
  var _textControllerGivenName = TextEditingController();
  var _textController1stDate = TextEditingController();
  var _textController2ndDate = TextEditingController();

  var primaryColor = Color(0xFF52ccc2);
  var btnColor = Color(0xFF52ccc2);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final adjustsizeh = MediaQuery.of(context).size.height * 0.0011;
    const double horizontalPadding = 50.0;
    const double verticalmargin = 3.0;

    return SingleChildScrollView(
        child: Scaffold(
            body: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              padding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: horizontalPadding),
              height: screenHeight / 20 + (screenHeight / 20),
              child: Align(
                  alignment: Alignment.center,
                  child: Text("Registration Form",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 30 * adjustsizeh,
                      )))),
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: verticalmargin, horizontal: horizontalPadding),
              height: screenHeight / 20,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Family Name",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20 * adjustsizeh,
                      )))),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: verticalmargin, horizontal: horizontalPadding),
            height: screenHeight / 14,
            child: TextField(
                style: new TextStyle(
                    fontSize: 25 * adjustsizeh, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Yamada",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
                controller: _textControllerFamilyName,
                keyboardType: TextInputType.number,
                inputFormatters: []),
          ),
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: verticalmargin, horizontal: horizontalPadding),
              height: screenHeight / 20,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Given Name",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20 * adjustsizeh,
                      )))),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: verticalmargin, horizontal: horizontalPadding),
            height: screenHeight / 14,
            child: TextField(
                style: new TextStyle(
                    fontSize: 25 * adjustsizeh, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Taro",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
                controller: _textControllerGivenName,
                keyboardType: TextInputType.text,
                inputFormatters: []),
          ),
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: verticalmargin, horizontal: horizontalPadding),
              height: screenHeight / 20,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Vaccination Date(1st Dose)",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20 * adjustsizeh,
                      )))),
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: verticalmargin, horizontal: horizontalPadding),
              height: screenHeight / 14,
              //color:Colors.blue,
              child: Row(

                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //color:Colors.red,
                      height: screenHeight / 14,
                      width: screenWidth * 0.35,
                      child: TextField(
                          style: new TextStyle(
                              fontSize: 25 * adjustsizeh, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "2021/01/01",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                          controller: _textController1stDate,
                          keyboardType: TextInputType.text,
                          inputFormatters: []),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today_outlined),
                      onPressed: () {
                        DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          // onChanged内の処理はDatepickerの選択に応じて毎回呼び出される
                          onChanged: (date) {
                            // print('change $date');
                          },
                          // onConfirm内の処理はDatepickerで選択完了後に呼び出される
                          onConfirm: (date) {
                            setState(() {
                              initializeDateFormatting("ja_JP");

                              var formatter =
                                  new DateFormat('yyyy/MM/dd', "ja_JP");

                              _textController1stDate = TextEditingController(
                                  text: formatter.format(date));
                            });
                          },
                          // Datepickerのデフォルトで表示する日時
                          currentTime: DateTime.now(),
                          // localによって色々な言語に対応
                          //  locale: LocaleType.en
                        );
                      },
                    )
                  ])),
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: verticalmargin, horizontal: horizontalPadding),
              height: screenHeight / 20,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Vaccination Date(2st Dose)",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20 * adjustsizeh,
                      )))),
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: verticalmargin, horizontal: horizontalPadding),
              height: screenHeight / 14,
              //color:Colors.blue,
              child: Row(

                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //color:Colors.red,
                      height: screenHeight / 14,
                      width: screenWidth * 0.35,
                      child: TextField(
                          style: new TextStyle(
                              fontSize: 25 * adjustsizeh, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "2021/01/01",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                          controller: _textController2ndDate,
                          keyboardType: TextInputType.text,
                          inputFormatters: []),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today_outlined),
                      onPressed: () {
                        DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          // onChanged内の処理はDatepickerの選択に応じて毎回呼び出される
                          onChanged: (date) {
                            // print('change $date');
                          },
                          // onConfirm内の処理はDatepickerで選択完了後に呼び出される
                          onConfirm: (date) {
                            setState(() {
                              initializeDateFormatting("ja_JP");

                              var formatter =
                                  new DateFormat('yyyy/MM/dd', "ja_JP");

                              _textController2ndDate = TextEditingController(
                                  text: formatter.format(date));
                            });
                          },
                          // Datepickerのデフォルトで表示する日時
                          currentTime: DateTime.now(),
                          // localによって色々な言語に対応
                          //  locale: LocaleType.en
                        );
                      },
                    )
                  ])),
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
                  "登録",
                  style: TextStyle(
                    fontSize: 20 * adjustsizeh,
                  ),
                ),
              ),
            ),
          ),
        ])));
  }
}
