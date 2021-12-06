import 'package:flutter/material.dart';


 moveToPage(BuildContext context,{String namePage}){
  return Navigator.of(context).pushNamed(namePage);
}