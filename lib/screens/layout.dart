import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/bloc/states.dart';
import 'package:audioplayer/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../styles.dart';

class Layout extends StatefulWidget {
  const Layout({Key key}) : super(key: key);

  static String id = "Layout";

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: drawerBuild(),
          key: key,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  key.currentState.openDrawer();
                  print('ok');
                },
                icon: Container(child: appBarIcon()),
              );
            }),
          ),
          backgroundColor: Color(0xFF383B49),
          body: Center(
            child: cubit.screens.elementAt(cubit.currentIndex),
          ),
          bottomNavigationBar: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                gradient: LinearGradient(colors: gradientColors),
                color: Colors.white,
              ),
              child: BottomNavigationBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white38,
                elevation: 20.0,
                backgroundColor: Colors.transparent,
                currentIndex: cubit.currentIndex,
                onTap: (int index) {
                  cubit.changePages(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 30,
                      ),
                      label: 'home'),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesome.music, size: 30), label: 'audio'),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesome.heart, size: 30),
                      label: 'favorite'),
                ],
              )),
        );
      },
    );
  }
}