import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text('Week 4'),
          ),
          drawer: Container(
            width: 200,
            height: 500,
            child: Drawer(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 5)
                        ),
                        child: DrawerHeader(
                          child: Center(
                              child: Text("Header", style: TextStyle(fontSize: 40, color: Colors.black),)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ListView(
                        children: [
                          ListTile(title: Text("Home")),
                          ListTile(title: Text("About")),
                          ListTile(title: Text("Settings")),
                          ListTile(title: Text("Hey 1")),
                          ListTile(title: Text("Hey 2")),
                          ListTile(title: Text("Hey 3")),
                          ListTile(title: Text("Hey 4")),
                        ]
                      ),
                    )
                  ],
                ),
              ),
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}