import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List games = [];

  @override
  void initState() {
    super.initState();
    this.getGames();
  }

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
                    child: Text(games[index]["title"], style: TextStyle(fontSize: 16),),
                  ),
                  separatorBuilder: (context, index) => Divider(height: 25)
                  , itemCount: games.length != 0 ? 10 : 0),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void getGames() async {
    var response = await http.get("https://www.freetogame.com/api/games");

    this.setState(() {
      games = json.decode(response.body);
    });
  }
}


