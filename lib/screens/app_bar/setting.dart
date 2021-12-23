import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);
  static String id = "SettingPage";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF383B49),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.501,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        children: [
          SizedBox(
            height: 150,
            width: 20,
            child: Image.asset(
              'images/BB.png',
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 150,
            width: 20,
            child: Image.asset(
              'images/BT.png',
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 150,
            width: 20,
            child: Image.asset(
              'images/PB.png',
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            height: 150,
            width: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'images/RB.png',
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
