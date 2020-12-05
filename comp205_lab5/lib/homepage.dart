import 'package:comp205_lab5/main.dart';
import 'package:comp205_lab5/secondpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage(this.name, this.flag);
  String name;
  bool flag;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(name)),
          backgroundColor: Colors.black,
        ),
        body: flag
          ? Container(
              child: ListView.builder(itemBuilder: (context, index) => CardItem(context, index), itemCount: 5,),

          ): Container(
              child: Center(child: Text('WRONG', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),)),
          ),

          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amberAccent,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined
            ),
          ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  CardItem(BuildContext context, int index) {
    return Padding(
      padding: (const EdgeInsets.all(10)),
      child: GestureDetector(
        onTap: () {
          SecondPage.name = 'Question ${index+1}';
          SecondPage.index = index;
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));

        },
        child: Card (
          color: MyApp.yesNo[index] == -1 ? Colors.red : (MyApp.yesNo[index] == 1 ? Colors.green : Colors.white),
          child: ListTile(
            title: Text('Question ${index+1}'),
            subtitle: Text('Yes or No'),
          ),
        ),
      ),
    );
  }
}
