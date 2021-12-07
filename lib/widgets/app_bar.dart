import 'package:audioplayer/components/navigator.dart';
import 'package:audioplayer/screens/contact_us.dart';
import 'package:audioplayer/screens/tracks.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

Widget appBarIcon() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: buildContainer(),
      ),
      const SizedBox(
        height: 5,
      ),
      buildContainer(width: 45),
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: buildContainer(),
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
      color: Colors.white,
      gradient: const LinearGradient(colors: [
        Color(0xFFCC0066),
        Colors.white,
        Color(0xFFCC0066),
      ]),
    ),
  );
}

Widget drawerBuild(BuildContext context){
  return  Drawer(
    child: Container(
      child: Column(
        children: [
          const SizedBox(height: 50,),
          drawerCard(name: 'Tracks',onTap: (){
            moveToPage(context,namePage: TracksPage.id);
          }),
          const SizedBox(height: 30,),
          drawerCard(name: 'Albums'),
          const SizedBox(height: 30,),
          drawerCard(name: 'PlayLists'),
          const SizedBox(height: 30,),
          drawerCard(name: 'Artis'),
          const SizedBox(height: 30,),
          drawerCard(name: 'Settings'),
          const SizedBox(height: 30,),
          drawerCard(name: 'Contact Us',onTap: (){
            moveToPage(context,namePage: ContactUs.id);
          }),
        ],
      ),
      decoration: BoxDecoration(
          gradient: SweepGradient(
            colors: gradientColors,
          )),
    ),
  );
}

Widget drawerCard({String name , Function onTap}){
  return  GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 30,
        color: Colors.white38,
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(15),
        ),
        child: Container(
          height: 60,
          width: double.infinity,
          child: Center(child: Text(name,style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),)),
          decoration: BoxDecoration(
            // color: Colors.white38,
            gradient: const LinearGradient(
              colors: [
                Color(0xFFCC0066),
                Colors.white38,
                Color(0xFF383B49),
              ],

            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
}
Widget drawerCardTrack({String name , Function onTap}){
  return  GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 30,
        color: Colors.white38,
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(15),
        ),
        child: Container(
          height: 60,
          width: double.infinity,
          child: Center(child: Text(name,style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis
          ),)),
          decoration: BoxDecoration(
            // color: Colors.white38,
            gradient: const LinearGradient(
              colors: [

                Colors.white38,
                Colors.black38
              ],

            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
}