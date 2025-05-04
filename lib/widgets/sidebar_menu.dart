import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/navigation_screen.dart';
import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: const Text(
              "Menu",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("Navigation"),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => NavigationScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("Search"),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SearchScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
