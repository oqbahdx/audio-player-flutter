import 'package:audioplayer/storage/shared_pref.dart';
import 'package:audioplayer/widgets/theme_widget.dart';
import 'package:flutter/material.dart';


class ThemesPage extends StatefulWidget {
  const ThemesPage({Key key}) : super(key: key);
 static String id="ThemesPage";
  @override
  _ThemesPageState createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:  GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.501,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        children: [
          chooseTheme(
            imagePath: 'images/BB.png',
            onTap: (){
              SharedPref.saveData(key: 'BB', value: 'BB');
            }
          ),
          chooseTheme(imagePath: 'images/PB.png',
              onTap: (){
                SharedPref.saveData(key: 'PB', value: 'PB');
              }),
          chooseTheme(imagePath: 'images/RB.png',
              onTap: (){
                SharedPref.saveData(key: 'RB', value: 'RB');
              }),
          chooseTheme(imagePath: 'images/BT.png',
              onTap: (){
                SharedPref.saveData(key: 'BT', value: 'BT');
              }),
        ],
      ),
    );
  }
}
