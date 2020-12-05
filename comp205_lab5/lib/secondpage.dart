import 'dart:math';

import 'package:comp205_lab5/homepage.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';

class SecondPage extends StatefulWidget {
  static String name;
  static int index;
  static bool flag = true;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SecondPage.name),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonStyleYes(context, 'Yes'),
            SizedBox(width: 10),
            ButtonStyleNo(context, 'No'),
          ],
        ),
      ),
    );
  }

  ButtonStyleNo(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          MyApp.yesNo[SecondPage.index] = -1;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(Login.appBarName, SecondPage.flag)));
      },
      child: Container(
        child: new Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(text),
          ),
        ),
      ),
    );
  }

  ButtonStyleYes(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          MyApp.yesNo[SecondPage.index] = 1;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(Login.appBarName, SecondPage.flag)));
      },
      child: Container(
        child: new Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
