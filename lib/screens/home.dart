import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF383B49),
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
            gradient: LinearGradient(colors: [
              Color(0xFFCC0066),
              Color(0xFF383B49),
              Color(0xFF383B49),
              Color(0xFFCC0066),
            ]),
            color: Colors.white,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome.music, size: 30), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome.heart, size: 30), label: 'home'),
            ],
          )),
    );
  }
}
