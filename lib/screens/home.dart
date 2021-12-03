import '/bloc/cubit.dart';
import '/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  static String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFF383B49),
          body: Center(
            child: Text(
              'Home',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
        );
      },
    );
  }
}
