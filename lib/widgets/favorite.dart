import 'package:audioplayer/styles/styles.dart';
import 'package:flutter/material.dart';

Widget buildCard({String name}){
  return Card(
    elevation: 25.0,
    color: Colors.transparent,
    child: Container(
      child: Center(
        child: Text(name,style: const TextStyle(
          fontSize: 22,
          color: Colors.white
        ),maxLines: 1,),
      ),
      height: 60,
      width: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: gradientColors
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )
      ),
    ),
  );
}