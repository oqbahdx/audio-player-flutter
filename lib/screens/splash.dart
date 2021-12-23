import 'dart:async';

import 'package:flutter/material.dart';

import 'layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  static String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushNamed( Layout.id);
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RotatedBox(
              quarterTurns: 2,
              child: LinearProgressIndicator(
                // color: Color(0xFFCC0066),
                // backgroundColor: Color(0xFF383B49),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(
                  height: 50,
                  width: 4,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: LinearProgressIndicator(
                        // color: Color(0xFFCC0066),
                        // backgroundColor: Color(0xFF383B49),
                      )),
                ),
                SizedBox(
                  height: 50,
                  width: 4,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: LinearProgressIndicator(
                        // color: Color(0xFFCC0066),
                        // backgroundColor: Color(0xFF383B49),
                      )),
                ),
                SizedBox(
                  height: 50,
                  width: 4,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: LinearProgressIndicator(
                        // color: Color(0xFFCC0066),
                        // backgroundColor: Color(0xFF383B49),
                      )),
                ),
            ],),
            const SizedBox(height: 20,),
            const LinearProgressIndicator(

              // color: Color(0xFFCC0066),
              //  backgroundColor: Color(0xFF383B49),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const RotatedBox(
                  quarterTurns: 1,
                  child: SizedBox(
                    width: 100,
                    child: LinearProgressIndicator(

                      // color: Color(0xFFCC0066),
                      //  backgroundColor: Color(0xFF383B49),
                    ),
                  ),
                ),
                Image.asset('assets/appLogo.png',width: 150,height: 150,),
                const RotatedBox(
                  quarterTurns: 1,
                  child: SizedBox(
                    width: 100,
                    child: LinearProgressIndicator(

                      // color: Color(0xFFCC0066),
                      //  backgroundColor: Color(0xFF383B49),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const RotatedBox(
              quarterTurns: 2,
              child: LinearProgressIndicator(
                // color: Color(0xFFCC0066),
                //  backgroundColor: Color(0xFF383B49),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(
                  height: 50,
                  width: 4,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: LinearProgressIndicator(
                        // color: Color(0xFFCC0066),
                        // backgroundColor: Color(0xFF383B49),
                      )),
                ),
                SizedBox(
                  height: 50,
                  width: 4,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: LinearProgressIndicator(
                        // color: Color(0xFFCC0066),
                        // backgroundColor: Color(0xFF383B49),
                      )),
                ),
                SizedBox(
                  height: 50,
                  width: 4,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: LinearProgressIndicator(
                        // color: Color(0xFFCC0066),
                        // backgroundColor: Color(0xFF383B49),
                      )),
                ),
              ],),
            const SizedBox(height: 20,),
            const LinearProgressIndicator(

            ),
          ],
        ),
      ),
    );
  }
}
