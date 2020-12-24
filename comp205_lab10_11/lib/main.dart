import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> configureLocalTimeZone() {
  tz.initializeTimeZones();
  var turkey = tz.getLocation('Europe/Istanbul');
  tz.setLocalLocation(turkey);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureLocalTimeZone();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  String selectedParam;
  String task;
  int val;

  Future<void> scheduleNotification() async {
    var scheduledTime;

    if (selectedParam == "Hours") {
      scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(hours: val));
    } else if (selectedParam == "Minutes") {
      scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(minutes: val));
    } else {
      scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: val));
    }

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "channel id", "channel name", "channel description",
        icon: "flutter_dev",
        largeIcon: DrawableResourceAndroidBitmap("flutter_dev"));
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
      macOS: null,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
        1, "Water Notification", task, scheduledTime, platformChannelSpecifics,
        uiLocalNotificationDateInterpretation: null,
        androidAllowWhileIdle: false);
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Week 10-11"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (_val) {
                    task = _val;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton(
                      value: selectedParam,
                      hint: Text("Time"),
                      items: [
                        DropdownMenuItem(child: Text("Seconds"), value: "Seconds",),
                        DropdownMenuItem(child: Text("Minutes"), value: "Minutes",),
                        DropdownMenuItem(child: Text("Hours"), value: "Hours",),
                      ],
                      onChanged: (_val) {
                        setState(() {
                          selectedParam = _val;
                        });
                      },
                    ),
                    DropdownButton(
                      value: val,
                      hint: Text("Duration"),
                      items: [
                        DropdownMenuItem(child: Text("5"), value: 5),
                        DropdownMenuItem(child: Text("10"), value: 10),
                        DropdownMenuItem(child: Text("15"), value: 15),
                        DropdownMenuItem(child: Text("20"), value: 20),
                      ],
                      onChanged: (_val) {
                        setState(() {
                          val = _val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text("Schedule Notification"),
                onPressed: scheduleNotification,
              ),
              RaisedButton(
                child: Text("Cancel Schedule Notification"),
                onPressed: cancelNotification,
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
