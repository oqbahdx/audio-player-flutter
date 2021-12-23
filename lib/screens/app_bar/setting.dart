import 'package:audioplayer/components/navigator.dart';
import 'package:audioplayer/screens/themes.dart';
import 'package:audioplayer/widgets/app_bar.dart';
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
      body:Column(

        children: [
          const SizedBox(height: 50,),
          drawerCardBuild(name: "Themes",onTap: (){
            moveToPage(context,namePage: ThemesPage.id);
          },),
          const SizedBox(height: 20,),
          drawerCardBuild(name: "Languages",onTap: (){
            // moveToPage(context,namePage: ThemesPage.id);
          },),
        ],
      ),
    );
  }
}
