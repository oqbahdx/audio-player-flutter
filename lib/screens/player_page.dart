import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/widgets/app_bar.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PlayerPage extends StatefulWidget {
  final String audioName;
  final String audioPath;

  static String id = 'PlayerPage';

  const PlayerPage({Key key, this.audioName, this.audioPath}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage>
    with SingleTickerProviderStateMixin {
  int timeProgress = 0;
  int audioDuration = 0;
  AnimationController _controller;

  void seekToSec(int sec) {
    Duration position = Duration(
      seconds: sec,
    );
    AppCubit
        .get(context)
        .audioPlayer
        .seek(position);
  }

  String getTimeToString(int milliseconds) {
    String minutes =
        '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000)
        .floor()}';
    String seconds =
        '${(milliseconds / 1000).floor() < 10 ? 0 : ''}${(milliseconds / 1000)
        .floor() % 60}';
    return '$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
    AppCubit
        .get(context)
        .audioCache =
        AudioCache(fixedPlayer: AppCubit
            .get(context)
            .audioPlayer);
    AppCubit
        .get(context)
        .audioPlayer
        .onPlayerStateChanged
        .listen((PlayerState state) {
      setState(() {
        AppCubit
            .get(context)
            .playerState = state;
      });
    });
    AppCubit
        .get(context)
        .audioPlayer
        .play(widget.audioPath);
    AppCubit
        .get(context)
        .audioPlayer
        .onDurationChanged
        .listen((Duration duration) {
      setState(() {
        audioDuration = duration.inMilliseconds;
      });
    });
    AppCubit
        .get(context)
        .audioPlayer
        .onAudioPositionChanged
        .listen((Duration position) {
      setState(() {
        timeProgress = position.inMilliseconds;
      });
    });
  }

  @override
  void dispose() {
    AppCubit
        .get(context)
        .audioPlayer
        .release();
    AppCubit
        .get(context)
        .audioPlayer
        .dispose();
    AppCubit
        .get(context)
        .audioCache
        .clearAll();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    var h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: h * 0.07,
          child: appBarText(widget.audioName),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.10,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    color: Theme.of(context).colorScheme.primary),
                child: Center(
                    child: Image.asset(
                      'images/iconholder.png',
                      fit: BoxFit.contain,
                      color:Theme.of(context).colorScheme.secondary,
                    )),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  widget.audioName,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip),
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getTimeToString(timeProgress),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: Theme
                          .of(context)
                          .sliderTheme
                          .copyWith(
                        activeTrackColor: Theme.of(context).colorScheme.primary,
                        inactiveTrackColor: Theme.of(context).colorScheme.secondary,

                      ),
                      child: Slider.adaptive(
                        divisions: 100,
                        label: getTimeToString(timeProgress),
                        value: (timeProgress / 1000).floorToDouble(),
                        onChanged: (value) {
                          seekToSec(value.toInt());
                        },
                        min: 0,
                        max: (audioDuration / 1000).floorToDouble(),
                        thumbColor :cubit.playerState == PlayerState.PLAYING?Colors.blue:Colors.red
                       ,
                      ),
                    ),
                  ),
                  Text(
                    getTimeToString(audioDuration),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(100),
                  gradient:  LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  )),
              child: IconButton(
                  onPressed: () {
                    cubit.playerState == PlayerState.PLAYING
                        ? cubit.pauseAudio()
                        : cubit.playAudio(path: widget.audioPath);
                  },
                  icon: cubit.playerState == PlayerState.PLAYING
                      ? const Icon(
                    Icons.pause,
                    color: Colors.red,
                    size: 50,
                  )
                      : const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.blue,
                    size: 50,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
