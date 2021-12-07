import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/bloc/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TracksPage extends StatefulWidget {
  const TracksPage({Key key}) : super(key: key);
  static String id = 'TracksPage';

  @override
  _TracksPageState createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF383B49),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text(
              'Tracks',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: ListView.builder(
            itemCount: AppCubit.get(context).songs.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Card(
                color: Colors.white,
                child: Container(
                  height: 50,
                  child: Center(
                      child: Text(AppCubit.get(context)
                          .songs
                          .elementAt(index)
                          .path
                          .split('/')
                          .last
                          .toString())),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
