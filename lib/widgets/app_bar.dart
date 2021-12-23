import 'package:audioplayer/components/navigator.dart';
import 'package:audioplayer/screens/app_bar/contact_us.dart';
import 'package:audioplayer/screens/app_bar/play_list.dart';
import 'package:audioplayer/screens/app_bar/setting.dart';
import 'package:audioplayer/screens/app_bar/tracks.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../styles/styles.dart';

Widget appBarIcon() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: DrowerBuild(),
      ),
      const SizedBox(
        height: 5,
      ),
      DrowerBuild(width: 45),
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: DrowerBuild(),
      )
    ],
  );
}

Widget buildContainer({double width = 25}) {
  return Container(
    height: 4,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      // color: Colors.white,
      gradient: LinearGradient(colors: [
        Colors.white,
        Color(0xFFCC0066),
      ]),
    ),
  );
}

class DrowerBuild extends StatelessWidget {
  double width;

  DrowerBuild({Key key, this.width = 25}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        // color: Colors.white,
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.secondary,
          Colors.white,
          Theme.of(context).colorScheme.secondary,
        ]),
      ),
    );
  }
}

Widget drawerBuild(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  return Drawer(
    child: Container(
      child: Column(
        children: [
          //
          //  SizedBox(height: h*0.1,),
          // drawerCard(name: 'Tracks',onTap: (){
          //   moveToPage(context,namePage: TracksPage.id);
          // }),
          // SizedBox(height: h*0.05,),
          // drawerCard(name: 'Albums'),
          // SizedBox(height: h*0.05,),
          // drawerCard(name: 'PlayLists',onTap:(){
          //   moveToPage(context,namePage: PlayLists.id);
          // } ),
          // SizedBox(height: h*0.05,),
          // drawerCard(name: 'Artis'),
          // SizedBox(height: h*0.05,),
          // drawerCard(name: 'Settings'),
          // SizedBox(height: h*0.05,),
          // drawerCard(name: 'Contact Us',onTap: (){
          //   moveToPage(context,namePage: ContactUs.id);
          // }),
          SizedBox(
            height: h * 0.1,
          ),
          drawerCardBuild(
              name: 'Tracks',
              onTap: () {
                moveToPage(context, namePage: TracksPage.id);
              }),
          SizedBox(
            height: h * 0.05,
          ),
          drawerCardBuild(name: 'Albums'),
          SizedBox(
            height: h * 0.05,
          ),
          drawerCardBuild(
              name: 'PlayLists',
              onTap: () {
                moveToPage(context, namePage: PlayLists.id);
              }),
          SizedBox(
            height: h * 0.05,
          ),
          drawerCardBuild(name: 'Artis'),
          SizedBox(
            height: h * 0.05,
          ),
          drawerCardBuild(name: 'Settings',onTap: (){
            moveToPage(context,namePage: SettingPage.id);
          },),
          SizedBox(
            height: h * 0.05,
          ),
          drawerCardBuild(
              name: 'Contact Us',
              onTap: () {
                moveToPage(context, namePage: ContactUs.id);
              }),
        ],
      ),
      decoration: BoxDecoration(
          gradient: SweepGradient(
        colors: [
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary,
        ],
      )),
    ),
  );
}

Widget drawerCard({String name, Function onTap, BuildContext context}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 30,
        // color: Colors.white38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: 60,
          width: double.infinity,
          child: Center(
              child: Text(
            name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          decoration: BoxDecoration(
            // color: Colors.white38,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Colors.white38,
                Color(0xFF383B49),
                // Theme.of(context).colorScheme.primary,
                // Theme.of(context).colorScheme.secondary,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
}

class drawerCardBuild extends StatefulWidget {
  Function onTap;
  String name;

  drawerCardBuild({Key key, this.onTap, this.name}) : super(key: key);

  @override
  _drawerCardBuildState createState() => _drawerCardBuildState();
}

class _drawerCardBuildState extends State<drawerCardBuild> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 30,
          // color: Colors.white38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 60,
            width: double.infinity,
            child: Center(
                child: Text(
              widget.name,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(
              // color: Colors.white38,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Colors.white38,
                  Theme.of(context).colorScheme.primary,
                ],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerCardTrackBuild extends StatelessWidget {
  String name;
  Function onTap;
  Function longTap;

  DrawerCardTrackBuild({Key key, this.name, this.onTap, this.longTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: longTap,
      child: Card(
        elevation: 30,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          child: Center(
              child: Text(
            name,
            style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                textAlign: TextAlign.center,
          )),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
          ),
        ),
      ),
    );
  }
}

Widget drawerCardTrack({String name, Function onTap, Function longTap}) {
  return GestureDetector(
    onTap: onTap,
    onLongPress: longTap,
    child: Card(
      elevation: 30,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        child: Center(
            child: Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            // color: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
          ),
        )),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        ),
      ),
    ),
  );
}

Widget appBarText(String txt) {
  return Marquee(
    text: txt,
    style: const TextStyle(fontWeight: FontWeight.bold),
    scrollAxis: Axis.horizontal,
    crossAxisAlignment: CrossAxisAlignment.start,
    blankSpace: 20.0,
    velocity: 100.0,
    pauseAfterRound: const Duration(seconds: 1),
    startPadding: 10.0,
    accelerationDuration: const Duration(seconds: 1),
    accelerationCurve: Curves.linear,
    decelerationDuration: const Duration(milliseconds: 500),
    decelerationCurve: Curves.easeOut,
  );
}
