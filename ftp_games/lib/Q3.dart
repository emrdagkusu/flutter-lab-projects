import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Game {
  final String title;

  Game({this.title});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      title: json['title'] as String,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Free to Play Games Database"),
        ),
        body: FutureBuilder<List<Game>>(
          future: fetchGames(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Icon(Icons.error_outline);

            return snapshot.hasData
                ? ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(snapshot.data[index].title, style: TextStyle(fontSize: 16),),
                ),
                separatorBuilder: (context, index) => Divider(height: 25)
                , itemCount: snapshot.data.length != 0 ? 10 : 0
            )
                : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
                      Text("Awaiting results...")
                    ],
                  ),
                );
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

Future<List<Game>> fetchGames(http.Client client) async {
  final response =
  await client.get('https://www.freetogame.com/api/games');

  return compute(parseGames, response.body);
}

List<Game> parseGames(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Game>((json) => Game.fromJson(json)).toList();
}
