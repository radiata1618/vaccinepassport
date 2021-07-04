import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  Show({Key key}) :super(key: key);

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show>{


  @override
  initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final adjustsizeh = MediaQuery.of(context).size.height*0.0011;

    return
      Scaffold(
          body:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ])
      );


  }
}