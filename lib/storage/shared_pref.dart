import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static storeData({String key, List<String> value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList(key, value);
  }

  static getData({String key})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getStringList(key);
  }
}
