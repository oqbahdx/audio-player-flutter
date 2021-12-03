import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class Layout extends StatefulWidget {
  const Layout({Key key}) : super(key: key);

  static String id = "Layout";

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
                gradient: LinearGradient(colors: [
                  Color(0xFFCC0066),
                  Color(0xFF383B49),
                  Color(0xFF383B49),
                  Color(0xFFCC0066),
                ]),
                color: Colors.white,
              ),
              child: BottomNavigationBar(
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
                      icon: Icon(FontAwesome.music, size: 30), label: 'home'),
                  BottomNavigationBarItem(
                      icon: Icon(FontAwesome.heart, size: 30), label: 'home'),
                ],
              )),
        );
      },
    );
  }
}
