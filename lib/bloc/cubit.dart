import '/bloc/states.dart';
import '/screens/all_audios.dart';
import '/screens/favorites.dart';
import '/screens/home.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  List<Widget> screens = [
    HomePage(),
    AllAudios(),
    Favorites(),
  ];
  int currentIndex = 0 ;
   changePages(int index){
    currentIndex = index;
    emit(ChangeScreensState());
  }

}