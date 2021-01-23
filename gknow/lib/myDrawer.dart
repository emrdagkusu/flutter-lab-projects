import 'package:flutter/material.dart';
import 'package:mobile_project_ui/bottomNavigation.dart';
import 'package:mobile_project_ui/favoriteUsers.dart';
import 'package:mobile_project_ui/profile.dart';
import 'package:mobile_project_ui/settings.dart';

class MyDrawer extends StatefulWidget {
  static int selectionIndex = 0;

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var deviceOrientation = MediaQuery.of(context).orientation;
    var screenSize = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: deviceOrientation == Orientation.portrait
                ? (screenSize > 720
                    ? (screenSize * 2.54) / 5
                    : (screenSize * 2.54) / 3.5)
                : 45,
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(Profile.avatarUrl)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize / 30,
                  ),
                  Text(
                    Profile.username,
                    style: TextStyle(color: Colors.amberAccent, fontSize: 20),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.account_circle),
            onTap: () {
              MyDrawer.selectionIndex = 0;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavigation()));
            },
          ),
          ListTile(
            title: Text('Search'),
            leading: Icon(Icons.search),
            onTap: () {
              MyDrawer.selectionIndex = 1;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavigation()));
            },
          ),
          ListTile(
            title: Text('Notifications'),
            leading: Icon(Icons.message_rounded),
            onTap: () {
              MyDrawer.selectionIndex = 2;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavigation()));
            },
          ),
          ListTile(
            title: Text('Favorite Users'),
            leading: Icon(Icons.notifications_active),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteUsers()));
            },
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
        ],
      ),
    );
  }
}
