import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Week 4'),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            child: Stack(
              alignment: Alignment(1,1),
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.black,
                  ),
                ),
                Stack(
                  alignment: Alignment(1,1),
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      color: Colors.green,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}