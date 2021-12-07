import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:marquee/marquee.dart';

class PlayerPage extends StatefulWidget {
  final String audioName;
  final String audioPath;

  const PlayerPage({this.audioName, this.audioPath});

  static String id = 'PlayerPage';

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  void initState() {
    AppCubit.get(context).audioCache =
        AudioCache(fixedPlayer: AppCubit.get(context).audioPlayer);
    AppCubit.get(context)
        .audioPlayer
        .onPlayerStateChanged
        .listen((PlayerState state) {
      setState(() {
        AppCubit.get(context).playerState = state;
      });
    });
    super.initState();
  }
 @override
  void dispose() {
   super.dispose();
   AppCubit.get(context).audioPlayer.release();
   AppCubit.get(context).audioPlayer.dispose();
   AppCubit.get(context).audioCache.clearAll();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Marquee(
            text: widget.audioName,
            style: TextStyle(fontWeight: FontWeight.bold),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 100.0,
            pauseAfterRound: Duration(seconds: 1),
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: const Color(0xFF383B49),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.black),
              child: const Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  widget.audioName,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '0.0',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Slider(
                      value: 50,
                      onChanged: (value) {},
                      min: 0,
                      max: 100,
                      activeColor: Color(0xFFCC0066),
                      inactiveColor: Color(0xFFFFFFFF),
                    ),
                  ),
                  Text(
                    '0.0',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            IconButton(onPressed: () {
              AppCubit.get(context).playerState == PlayerState.PLAYING?
                  AppCubit.get(context).pauseAudio():
                  AppCubit.get(context).playAudio(path: widget.audioPath);
            }, icon: Icon(AppCubit.get(context).playerState == PlayerState.PLAYING?
            Icons.pause:Icons.play_arrow_rounded
            ),)
          ],
        ),
      ),
    );
  }
}
