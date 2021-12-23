import '/bloc/cubit.dart';
import '/bloc/states.dart';
import '/components/navigator.dart';
import '/screens/player_page.dart';
import '/widgets/app_bar.dart';
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
                    child: DrawerCardTrackBuild(
                      longTap: () {
                        // if (!AppCubit.get(context)
                        //     .favorites
                        //     .contains(AppCubit.get(context).songs[index])) {
                        //   AppCubit.get(context).addToFavorites(
                        //       fileName: AppCubit.get(context).songs[index]);
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text(
                        //           "add ${AppCubit.get(context).favorites.elementAt(index).path.split('/').last} to favorite")));
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text(
                        //     "it's already exist ${AppCubit.get(context).favorites.elementAt(index).path.split('/').last} in favorite",
                        //     style: const TextStyle(color: Colors.red),
                        //   )));
                        // }
                        AppCubit.get(context).getFileMetaData(
                            filePath: AppCubit.get(context)
                                .songs[index]
                                .path.split('/').last);
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
