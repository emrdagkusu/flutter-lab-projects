import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar( centerTitle: true,
        title: Center(
          child: Text("Emrullah Dagkusu"),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
          child: Container(
            color: Colors.amber,
            width: 200,
            height: 200,
            child: Text(
              "110510156",
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.justify,
            ),
            padding: EdgeInsets.fromLTRB(48, 96, 0, 0),
            margin: EdgeInsets.fromLTRB(48, 96, 0, 0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print("Welcome");
        },
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

