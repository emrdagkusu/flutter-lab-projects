import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> games = ["Dauntless", "World of Tanks", "Warframe", "Cuisine Royale", "Crossout", "Blade and Soul", "Armored Warfare", "Trove", "World of Warship", "ArcheAge"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Free to Play Games Database"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(games[index], style: TextStyle(fontSize: 16),),
                    ),
                    separatorBuilder: (context, index) => Divider(height: 25)
                    , itemCount: 10),
              )
            ],
          ),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}

