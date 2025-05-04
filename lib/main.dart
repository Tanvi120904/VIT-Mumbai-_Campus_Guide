import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CampusNavigatorApp());
}

class CampusNavigatorApp extends StatelessWidget {
  const CampusNavigatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Navigator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light,
      ),
      home: HomeScreen(),
    );
  }
}
