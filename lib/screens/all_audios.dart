import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/bloc/states.dart';
import 'package:audioplayer/components/navigator.dart';
import 'package:audioplayer/screens/player_page.dart';
import 'package:audioplayer/widgets/home_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAudios extends StatefulWidget {
  const AllAudios({Key key}) : super(key: key);

  @override
  _AllAudiosState createState() => _AllAudiosState();
}

class _AllAudiosState extends State<AllAudios> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(

            body: ListView.separated(
                itemBuilder: (context, index) => AudioListBuild( audioName: cubit.songs[index].path.split('/').last,onTap: (){
                  moveToPageWithData(context,
                      namePage: PlayerPage(
                        audioName: AppCubit.get(context)
                            .songs
                            .elementAt(index)
                            .path
                            .split('/')
                            .last,
                        audioPath: AppCubit.get(context)
                            .songs
                            .elementAt(index)
                            .path,
                      ));
                }),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: cubit.songs.length));
      },
    );
  }
}
