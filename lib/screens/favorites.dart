import 'package:flutter/material.dart';


class Favorites extends StatefulWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF383B49),
      body: Center(
        child: Text('favorites' , style: TextStyle(color: Colors.white, fontSize: 35),),
      ),
    );
  }
}
