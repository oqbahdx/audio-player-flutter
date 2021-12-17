import 'package:audioplayer/bloc/cubit.dart';
import 'package:audioplayer/bloc/states.dart';
import 'package:audioplayer/styles/styles.dart';
import 'package:audioplayer/widgets/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: const Color(0xFF383B49),
            body: cubit.favorites.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Dismissible(
                            key: Key(cubit.favorites[index].toString()),
                            onDismissed: (DismissDirection direction) {
                              cubit.removeFromFavorites(index: index);
                            },
                             direction: DismissDirection.endToStart,
                            child: buildCard(
                                name: cubit.favorites[index].path
                                    .split('/')
                                    .last
                                    .toString()),
                          ),
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          thickness: 1.5,
                          color: Colors.white,
                        ),
                    itemCount: cubit.favorites.length)
                : Center(
                    child: Text(
                      'Favorite is empty',
                      style: bigTex,
                    ),
                  ));
      },
    );
  }
}
