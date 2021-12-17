import 'dart:convert';

import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/bloc/states.dart';
import 'package:audioplayer/components/navigator.dart';
import 'package:audioplayer/screens/player_page.dart';
import 'package:audioplayer/storage/shared_pref.dart';
import 'package:audioplayer/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TracksPage extends StatefulWidget {
  const TracksPage({Key key}) : super(key: key);
  static String id = 'TracksPage';

  @override
  _TracksPageState createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  // List<int> mp3Bytes = File('').readAsBytesSync();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF383B49),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text(
              'Tracks',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: AppCubit.get(context).songs.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: AppCubit.get(context).songs.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: drawerCardTrack(
                      longTap: () {
                        if (!AppCubit.get(context)
                            .favorites
                            .contains(AppCubit.get(context).songs[index])) {
                          AppCubit.get(context).addToFavorites(
                              fileName: AppCubit.get(context).songs[index]);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "add ${AppCubit.get(context).favorites.elementAt(index).path.split('/').last} to favorite")));
                               //  var list = jsonDecode( AppCubit.get(context).favorites.toString());
                               //
                               // SharedPref.storeData(key: 'favorite',value:list);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "it's already exist ${AppCubit.get(context).favorites.elementAt(index).path.split('/').last} in favorite",
                            style: const TextStyle(color: Colors.red),
                          )));
                        }
                      },
                      onTap: () {
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
                      },
                      name: AppCubit.get(context)
                          .songs
                          .elementAt(index)
                          .path
                          .split('/')
                          .last,
                    ),
                  ),
                )
              : const Center(
                  child: Text(
                    "No Tracks",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white54),
                  ),
                ),
        );
      },
    );
  }
}
