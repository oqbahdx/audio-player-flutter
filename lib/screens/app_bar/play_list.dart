import 'package:flutter/material.dart';


class PlayLists extends StatefulWidget {
  const PlayLists({Key key}) : super(key: key);
 static String id = "PlayLists";
  @override
  _PlayListsState createState() => _PlayListsState();
}

class _PlayListsState extends State<PlayLists> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("playlist page"),
      ),
    );
  }
}
