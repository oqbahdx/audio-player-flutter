import 'package:audioplayer/components/navigator.dart';
import 'package:audioplayer/screens/contact_us.dart';
import 'package:audioplayer/screens/tracks.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';


Widget appBarIcon() {
  // double h = MediaQuery.of(context).size.height;
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
  var h = MediaQuery.of(context).size.height;
  return  Drawer(
    child: Container(
      child: Column(
        children: [
           SizedBox(height: h*0.1,),
          drawerCard(name: 'Tracks',onTap: (){
            moveToPage(context,namePage: TracksPage.id);
          }),
          SizedBox(height: h*0.05,),
          drawerCard(name: 'Albums'),
          SizedBox(height: h*0.05,),
          drawerCard(name: 'PlayLists'),
          SizedBox(height: h*0.05,),
          drawerCard(name: 'Artis'),
          SizedBox(height: h*0.05,),
          drawerCard(name: 'Settings'),
          SizedBox(height: h*0.05,),
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

Widget drawerCard({String name , Function onTap,}){

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

Widget drawerCardTrack({String name , Function onTap,Function longTap}){
  return  GestureDetector(
    onTap: onTap,
    onLongPress: longTap,
    child: Card(
      elevation: 30,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius:  BorderRadius.circular(15),
      ),
      child: Container(
        height: 60,
        width: double.infinity,
        child: Center(child: Text(name,style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          color: Colors.white,
          overflow: TextOverflow.ellipsis
        ),)),
        decoration: BoxDecoration(

          gradient:  LinearGradient(
            colors: gradientColors,

          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)
          ),
        ),
      ),
    ),
  );
}