import 'package:flutter/material.dart';


class PlayerPage extends StatefulWidget {
   PlayerPage({Key key}) : super(key: key);
   static String id = 'PlayerPage';
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with SingleTickerProviderStateMixin {

  @override
  AnimationController _controller;
  Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0.001,
        lowerBound: 0.001,
        upperBound: 1.0
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF383B49),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 150,),
            RotationTransition(
              turns: _animation,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.black
                ),
                child: Center(
                  child: Text('FLUTTER',style: TextStyle(
                    fontSize: 35,
                    color: Colors.white
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
