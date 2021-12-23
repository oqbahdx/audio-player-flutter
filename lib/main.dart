import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/screens/app_bar/contact_us.dart';
import 'package:audioplayer/screens/app_bar/play_list.dart';
import 'package:audioplayer/screens/app_bar/setting.dart';
import 'package:audioplayer/screens/home.dart';
import 'package:audioplayer/screens/layout.dart';
import 'package:audioplayer/screens/player_page.dart';
import 'package:audioplayer/screens/splash.dart';
import 'package:audioplayer/screens/app_bar/tracks.dart';
import 'package:audioplayer/screens/themes.dart';
import 'package:audioplayer/storage/shared_pref.dart';
import 'package:audioplayer/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<ThemeData> main() async{
  WidgetsFlutterBinding.ensureInitialized();
   // ThemeData appTheme;
   // var theme = SharedPref.getData(key: 'BB');
   // switch(theme){
   //   case 'BB':
   //     return appTheme = pinkAndDarkGrayTheme;
   //     break;
   //   case 'BT':
   //     return appTheme = blackAndTealTheme;
   //     break;
   //   case 'PB':
   //     return appTheme = pinkAndDarkGrayTheme;
   //     break;
   //   case 'RB':
   //     return appTheme = redAndPinkTheme;
   //     break;
   // }

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // ThemeData theme;
   MyApp({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAllAudios(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        theme: beigeAndTealTheme,
        routes: {
          SplashScreen.id: (_) => const SplashScreen(),
          HomePage.id: (_) => const HomePage(),
          Layout.id: (_) => const Layout(),
          PlayerPage.id: (_) => const PlayerPage(),
          ContactUs.id: (_) => const ContactUs(),
          TracksPage.id:(_)=>const TracksPage(),
          SettingPage.id:(_)=>const SettingPage(),
          PlayLists.id:(_)=>const PlayLists(),
          ThemesPage.id:(_)=> const ThemesPage()
        },
      ),
    );
  }
}
