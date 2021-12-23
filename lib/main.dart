import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/screens/app_bar/contact_us.dart';
import 'package:audioplayer/screens/app_bar/play_list.dart';
import 'package:audioplayer/screens/app_bar/setting.dart';
import 'package:audioplayer/screens/home.dart';
import 'package:audioplayer/screens/layout.dart';
import 'package:audioplayer/screens/player_page.dart';
import 'package:audioplayer/screens/splash.dart';
import 'package:audioplayer/screens/app_bar/tracks.dart';
import 'package:audioplayer/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAllAudios(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        theme: blackAndTealTheme,
        routes: {
          SplashScreen.id: (_) => const SplashScreen(),
          HomePage.id: (_) => const HomePage(),
          Layout.id: (_) => const Layout(),
          PlayerPage.id: (_) => const PlayerPage(),
          ContactUs.id: (_) => const ContactUs(),
          TracksPage.id:(_)=>const TracksPage(),
          SettingPage.id:(_)=>const SettingPage(),
          PlayLists.id:(_)=>const PlayLists()
        },
      ),
    );
  }
}
