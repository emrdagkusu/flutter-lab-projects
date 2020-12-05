import 'package:flutter/material.dart';
import 'homepage.dart';

class Login extends StatefulWidget {
  static String appBarName;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  bool flag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Login')),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameControl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  labelText: 'Name'
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: passwordControl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password'
                ),
              ),
              SizedBox(height: 10),
              FlatButton(
                color: Colors.amberAccent,
                onPressed: () {
                  if (nameControl.text == 'mustafa' && passwordControl.text == '123') {
                    setState(() {
                      flag = true;
                    });
                  } else {
                    setState(() {
                      flag = false;
                    });
                  }
                  Login.appBarName = nameControl.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(Login.appBarName, flag)));
                },
                child: Text('Login'),

              )
            ],
          ),
        ),
    );
  }
}
