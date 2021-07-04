import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

import 'db.dart';

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
  var hintColor = Color(0xFFD0D0D0);

  bool initialDataRead=false;

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

    MyDatabase db = MyDatabase();

    if(initialDataRead==false) {
      loadAsset(db);
    }


    return  Scaffold(
            body: SingleChildScrollView(
                child:Column(
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
                  hintStyle: TextStyle(color: hintColor),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
                controller: _textControllerFamilyName,
                keyboardType: TextInputType.text,
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
                  hintStyle: TextStyle(color: hintColor),
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
                            hintStyle: TextStyle(color: hintColor),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                          controller: _textController1stDate,
                          keyboardType: TextInputType.text,//数値とスラッシュのみを許すようにしたい。。。
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
                  child: Text("Vaccination Date(2nd Dose)",
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
                            hintStyle: TextStyle(color: hintColor),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                          controller: _textController2ndDate,
                          keyboardType: TextInputType.text,
                          inputFormatters: []),//数値とスラッシュのみを許すようにしたい。。。
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

                  changeParameter(_textControllerFamilyName.text
                  ,_textControllerGivenName.text
                  ,_textController1stDate.text
                  ,_textController2ndDate.text
                  ,db);

                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: btnColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.1),
                    )),
                child: Text(
                  "register",
                  style: TextStyle(
                    fontSize: 20 * adjustsizeh,
                  ),
                ),
              ),
            ),
          ),
        ])));
  }

  Future<void> loadAsset(
      MyDatabase db
      ) async{

    List<Parameter> familyNameList = await db.selectParameterByCode("familyName");
    List<Parameter> givenNameList = await db.selectParameterByCode("givenName");
    List<Parameter> date1List = await db.selectParameterByCode("date1");
    List<Parameter> date2List = await db.selectParameterByCode("date2");

    setState((){

      _textControllerFamilyName = TextEditingController(
          text: familyNameList[0].textValue);

      _textControllerGivenName = TextEditingController(
          text: givenNameList[0].textValue);

      _textController1stDate = TextEditingController(
          text: date1List[0].textValue);

    _textController2ndDate = TextEditingController(
        text: date2List[0].textValue);
      initialDataRead=true;
  })


    ;


  }

  Future<void> changeParameter(String familyName
      ,String givenName
      ,String date1
      ,String date2
      ,MyDatabase db
      ) async{


    //delete all
    List<Parameter> pList = await db.getAllparameters();
    for(var parameter in pList){
      await db.deleteparameter(parameter);
    }

    //register
    Parameter parameterFamilyName = Parameter(
        code:"familyName"
        ,numberValue:1
        ,textValue:familyName);
    db.insertparameter(parameterFamilyName);

    Parameter parameterGivenName = Parameter(
        code:"givenName"
        ,numberValue:2
        ,textValue:givenName);
    db.insertparameter(parameterGivenName);

    Parameter parameterDate1 = Parameter(
        code:"date1"
        ,numberValue:3
        ,textValue:date1);
    db.insertparameter(parameterDate1);

    Parameter parameterDate2 = Parameter(
        code:"date2"
        ,numberValue:4
        ,textValue:date2);
    db.insertparameter(parameterDate2);
  }

}

