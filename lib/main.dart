import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/screens/home.dart';
import 'package:audioplayer/screens/layout.dart';
import 'package:audioplayer/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        theme: ThemeData(
          textTheme: GoogleFonts.redHatDisplayTextTheme()
        ),
        routes: {
          SplashScreen.id: (_) => const SplashScreen(),
          HomePage.id:(_)=>const HomePage(),
          Layout.id:(_)=>const Layout()
        },
      ),
    );
  }
}
