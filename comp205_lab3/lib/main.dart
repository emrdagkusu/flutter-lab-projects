import 'package:flutter/cupertino.dart';
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
        backgroundColor: Colors.white24,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Week 3'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget> [
                      Expanded(
                          child: Container(
                            color: Colors.red,
                            child: Center(child: Icon(Icons.ac_unit, size: 45, color: Colors.white,)),
                        ),
                      ),
                      Expanded(
                          child: Container(
                            color: Colors.green,
                            child: Center(child: Text('2', textAlign: TextAlign.center)),
                          )
                      ),
                      Expanded(
                          child: Container(
                            color: Colors.blue,
                            child: Center(child: Icon(Icons.youtube_searched_for_rounded, size: 45, color: Colors.white,)),
                          )
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 15,
                  child: ListView(
                    padding: EdgeInsets.all(10.0),
                    children: <Widget> [
                      Container(
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.alarm,
                              size: 45,
                              color: Colors.amberAccent,
                              ),
                            title: Text('Blue Pale Dot'),
                            subtitle: Text('Everything is inside of that blue pale dot.'),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.favorite,
                              size: 45,
                              color: Colors.red,
                              ),
                            title: Text('Most people do not really want freedom.'),
                            subtitle: Text('Because freedom involves responsibility, and most people are frightened of responsibility.'),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        color: Colors.deepOrange,
                        child: Center(child: Text('Entry A', style: TextStyle(fontSize: 20, color: Colors.white),)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        color: Colors.amberAccent,
                        child: Center(child: Text('Entry B', style: TextStyle(fontSize: 20, color: Colors.white),)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        color: Colors.tealAccent,
                        child: Center(child: Text('Entry C', style: TextStyle(fontSize: 20, color: Colors.white),)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        color: Colors.redAccent,
                        child: Center(child: Text('Entry D', style: TextStyle(fontSize: 20, color: Colors.white),)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.elevator,
                            size: 45,
                            color: Colors.lightGreen,
                          ),
                          title: Text('Платон', style: TextStyle(fontSize: 18, color: Colors.black),),
                          subtitle: Text('Наблюдайте, слушайте, тише, немного судите, много спрашивайте!', style: TextStyle(fontSize: 14, color: Colors.black),),
                          selected: true,
                          trailing: Icon(Icons.bike_scooter,
                            size: 45,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.sanitizer,
                            size: 45,
                            color: Colors.greenAccent,
                          ),
                          title: Text('Widget of the Week 3', style: TextStyle(fontSize: 18, color: Colors.black),),
                          subtitle: Text('It is an honor to say hi to you!', style: TextStyle(fontSize: 14, color: Colors.black),),
                          selected: true,
                          trailing: Icon(Icons.face,
                            size: 45,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
              Expanded(
                flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                            color: Colors.black,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                      child: TextButton(
                                        child: Text('Text Button', style: TextStyle(fontSize: 25, color: Colors.white),),
                                        onPressed: () {
                                          print('Hello');
                                        },
                                      ),
                                    ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    decoration: new BoxDecoration(
                                        border: new Border(left: BorderSide(width: 3, color: Colors.white))
                                    ),
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.white,
                                      child: const Icon(
                                        Icons.add,
                                        size: 40,
                                        color: Colors.black,
                                        ),
                                      onPressed: () {
                                        print("FAB");
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}