import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:marquee/marquee.dart';

class PlayerPage extends StatefulWidget {
  final String audioName;

  const PlayerPage({this.audioName});

  static String id = 'PlayerPage';

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0.001,
        lowerBound: 0.001,
        upperBound: 1.0);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.forward();
    print(widget.audioName);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
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
            RotationTransition(
              turns: _animation,
              child: Container(
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
            )
          ],
        ),
      ),
    );
  }
}
