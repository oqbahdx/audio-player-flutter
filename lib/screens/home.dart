import 'package:audioplayer/widgets/home_widget.dart';

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
          backgroundColor: const Color(0xFF383B49),
          // body: Container(
          //     alignment: Alignment.center,
          //     child: Column(
          //       children: [
          //         const SizedBox(
          //           height: 20,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             homeContainer(
          //               onTap: () {},
          //               images: AppCubit.get(context).maroon5,
          //             ),
          //             homeContainer(
          //               onTap: () {},
          //               images: AppCubit.get(context).taylor,
          //             ),
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 30,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             homeContainer(
          //               onTap: () {},
          //               images: AppCubit.get(context).minaj,
          //             ),
          //             homeContainer(
          //               onTap: () {},
          //               images: AppCubit.get(context).snoop,
          //             ),
          //           ],
          //         ),
          //         const SizedBox(
          //           height: 30,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             homeContainer(
          //               onTap: () {},
          //               images: AppCubit.get(context).flo,
          //             ),
          //             homeContainer(
          //               onTap: () {},
          //               images: AppCubit.get(context).miley,
          //             ),
          //           ],
          //         ),
          //       ],
          //     )),
        );
      },
    );
  }
}
