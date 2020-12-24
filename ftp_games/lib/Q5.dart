import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

enum MenuOption { Settings }

class _MyAppState extends State<MyApp> {

  String url = Settings._current == null ? 'https://www.freetogame.com/api/games' : 'https://www.freetogame.com/api/games?category=${Settings._current}';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder (
        builder: (context) =>

      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Free to Play Games Database"),
          actions: <Widget>[
            PopupMenuButton<MenuOption>(
              onSelected: (value) {
                if (value == MenuOption.Settings) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuOption>>[
                const PopupMenuItem<MenuOption>(
                  value: MenuOption.Settings,
                  child: Text('Settings'),
                ),
              ],
            )
          ],
        ),
        body: FutureBuilder<List<Game>>(
          future: fetchGames(http.Client(), url),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

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
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


Future<List<Game>> fetchGames(http.Client client, String url) async {
  var response =
  await client.get(Uri.encodeFull(url));
  return compute(parseGames, response.body);
}

List<Game> parseGames(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Game>((json) => Game.fromJson(json)).toList();
}

class Settings extends StatefulWidget {
  static String _current;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Settings"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text('Shooter'),
                leading: Radio(
                  value: "shooter",
                  groupValue: Settings._current,
                  onChanged: (String value) {
                    setState(() {
                      Settings._current = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Massively Multiplayer Online First-Person Shooter'),
                leading: Radio(
                  value: "mmofps",
                  groupValue: Settings._current,
                  onChanged: (String value) {
                    setState(() {
                      Settings._current = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Player versus Player'),
                leading: Radio(
                  value: "pvp",
                  groupValue: Settings._current,
                  onChanged: (String value) {
                    setState(() {
                      Settings._current = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Massively Multiplayer Online Role-Playing Game'),
                leading: Radio(
                  value: "mmorpg",
                  groupValue: Settings._current,
                  onChanged: (String value) {
                    setState(() {
                      Settings._current = value;
                    });
                  },
                ),
              ),
              FlatButton(
                color: Colors.black,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueGrey,
                onPressed: () {
                  setSharedPreferences(Settings._current);
                  print(Settings._current);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Text(
                  "OK",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  getSharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Settings._current = pref.getString("GameType") ?? "";
    });
  }

  setSharedPreferences(String gameType) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("GameType", gameType);
  }
}



