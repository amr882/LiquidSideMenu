import 'package:flutter/material.dart';
import 'package:liquid_side_menu/liquid_side_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LiquidSideMenu(
        sideMenuIcon: Icon(Icons.menu, size: 15),
        sideMenuItems: [
          SideMenuItem(onTap: () {}, text: "HOME"),
          SideMenuItem(onTap: () {}, text: "PROFILE"),
          SideMenuItem(onTap: () {}, text: "SETTINGS"),
          SideMenuItem(onTap: () {}, text: "HELP"),
          SideMenuItem(onTap: () {}, text: "LOGOUT"),
        ],
        child: Container(),
      ),
    );
  }
}
