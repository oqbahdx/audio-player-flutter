import 'package:audioplayer/bloc/states.dart';
import 'package:bloc/bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

}