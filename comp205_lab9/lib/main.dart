
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController stringControl = new TextEditingController();
  TextEditingController doubleControl = new TextEditingController();
  TextEditingController integerControl = new TextEditingController();
  bool checkbox = false;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
              child: Text("Week 9", style: TextStyle(color: Colors.white))),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Boolean"),
                    SizedBox(
                      width: 20,
                    ),
                    Checkbox(
                      value: checkbox,
                      onChanged: (bool value) {
                        setState(() {
                          checkbox = value;
                        });
                      },
                    ),
                  ],
                ),
                TextFieldContainer(stringControl, "String"),
                TextFieldContainer(doubleControl, "Double"),
                TextFieldContainer(integerControl, "Integer"),
                FloatingActionButton(
                  child: Icon(Icons.save_rounded),
                  onPressed: () => setSharedPreferences(
                      checkbox,
                      stringControl.text,
                      double.parse(doubleControl.text),
                      int.parse(integerControl.text)
                  )
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  getSharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      checkbox = pref.getBool("Boolean") ?? false;
      stringControl.text = pref.getString("String") ?? "";
      doubleControl.text = (pref.getDouble("Double") ?? 0).toString();
      integerControl.text = (pref.getInt("Integer") ?? 0).toString();
    });
  }

  setSharedPreferences(
      bool checkbox, String string, double double, int integer) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("Boolean", checkbox);
    await pref.setString("String", string);
    await pref.setDouble("Double", double);
    await pref.setInt("Integer", integer);
    show("Saved");
  }

  void show(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
    print("Successful");
  }
}

Widget TextFieldContainer(TextEditingController controller, String title) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: new InputDecoration(
          focusColor: Color(0xff329D9C),
          focusedBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Color(0xff329D9C))),
          enabledBorder: new OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color(0xff329D9C)),
          ),
          filled: true,
          hintText: controller.text,
          fillColor: Colors.white,
          labelText: title,
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}
