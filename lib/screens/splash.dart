import 'dart:async';

import 'package:flutter/material.dart';

import 'layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  static String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushNamed( Layout.id);
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF383B49),
      body: Center(
        child: Image.asset('assets/Logo.png'),
      ),
    );
  }
}
