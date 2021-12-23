import 'package:flutter/material.dart';


Widget chooseTheme({String imagePath,Function onTap}){
  return Card(
    color: Colors.transparent,
    elevation: 20.0,
    child: GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
          ),
          height: 150,
          width: 20,
          child: ClipRRect(
            child: Image.asset(
              imagePath,
              height: double.infinity,
              width: double.infinity,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
  );
}