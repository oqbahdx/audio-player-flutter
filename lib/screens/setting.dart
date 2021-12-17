import 'package:flutter/material.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);
  static String id = "SettingPage";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF383B49),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: const [
            SizedBox(height: 150,),
            Icon(Icons.ac_unit_outlined,size:150,color: Colors.white)
          ],
        ),
      ),
    );
  }
}
