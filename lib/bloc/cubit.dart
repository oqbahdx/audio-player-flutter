import 'dart:io';

import '/bloc/states.dart';
import '/screens/all_audios.dart';
import '/screens/favorites.dart';
import '/screens/home.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  List<Widget> screens = [
    const HomePage(),
    const AllAudios(),
    const Favorites(),
  ];
  int currentIndex = 0 ;
   changePages(int index){
    currentIndex = index;
    emit(ChangeScreensState());
  }
  AudioPlayer audioPlayer = AudioPlayer();
  playLocal() async {
    int result = await audioPlayer.play('localPath', isLocal: true);
    return result;
  }

  List<FileSystemEntity> files;
  List<FileSystemEntity> songs = [];
  getAllAudios(){
    Directory dir = Directory('/storage/emulated/0/');
    String mp3Path = dir.toString();
    print(mp3Path);

    files = dir.listSync(recursive: true, followLinks: false);
    for(FileSystemEntity entity in files) {
      String path = entity.path;
      if(path.endsWith('.mp3'))
        songs.add(entity);
    }
    print(songs);
    print(songs.length);
  }

  List<String> maroon5 = [
    'images/maroon1.jpg',
    'images/maroon2.jpg',
    'images/maroon3.jpg',
    'images/maroon4.jpg',
  ];
  List<String> taylor = [
    'images/taylor1.jpg',
    'images/taylor2.jpg',
    'images/taylor3.jpg',
    'images/taylor4.jpg',
  ];
  List<String> minaj = [
    'images/minaj1.jpg',
    'images/minaj2.jpg',
    'images/minaj3.png',
    'images/minaj4.jpg',
  ];
  List<String> snoop = [
    'images/snoop1.jpg',
    'images/snoop2.jpg',
    'images/snoop3.jpg',
    'images/snoop4.jpg',
  ];
  List<String> flo = [
    'images/flo1.jpg',
    'images/flo2.jpg',
    'images/flo3.jpg',
    'images/flo4.jpg',
  ];
  List<String> miley = [
    'images/miley1.jpg',
    'images/miley2.png',
    'images/miley3.jpg',
    'images/miley4.jpg',
  ];

   }


