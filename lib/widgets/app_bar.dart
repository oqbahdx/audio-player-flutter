import 'package:flutter/material.dart';

import '../styles.dart';

Widget appBarIcon() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: buildContainer(),
      ),
      SizedBox(
        height: 5,
      ),
      buildContainer(width: 45),
      SizedBox(
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
      gradient: LinearGradient(colors: [
        Color(0xFFCC0066),
        Colors.white,
        Color(0xFFCC0066),
      ]),
    ),
  );
}

Widget drawerBuild(){
  return  Drawer(
    child: Container(
      child: Column(
        children: [
          SizedBox(height: 50,),
          drawerCard(name: '123'),
          SizedBox(height: 30,),
          drawerCard(name: '123'),
        ],
      ),
      decoration: BoxDecoration(
          gradient: SweepGradient(
            colors: gradientColors,
          )),
    ),
  );
}

Widget drawerCard({String name}){
  return  Padding(
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
        child: Center(child: Text(name,style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),)),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}