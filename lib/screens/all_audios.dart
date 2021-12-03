import 'package:flutter/material.dart';

class AllAudios extends StatefulWidget {
  const AllAudios({Key key}) : super(key: key);

  @override
  _AllAudiosState createState() => _AllAudiosState();
}

class _AllAudiosState extends State<AllAudios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF383B49),
      body: Center(
        child: Text(
          'All Audios',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
    );
  }
}
