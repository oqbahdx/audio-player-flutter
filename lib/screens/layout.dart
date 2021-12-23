import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/bloc/states.dart';
import 'package:audioplayer/widgets/app_bar.dart';
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
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: drawerBuild(context),
          key: key,
          appBar: AppBar(
           backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  key.currentState.openDrawer();
                },
                icon: Container(child: appBarIcon()),
              );
            }),
          ),
          // backgroundColor: const Color(0xFF383B49),
          body: Center(
            child: cubit.screens.elementAt(cubit.currentIndex),
          ),
          bottomNavigationBar: Container(
              height: h*0.09,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ]),
                // color: Colors.white,
              ),
              child: BottomNavigationBar(

                elevation: 20.0,
                backgroundColor: Colors.transparent,
                currentIndex: cubit.currentIndex,
                onTap: (int index) {
                  cubit.changePages(index);
                },
                items: const [
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
