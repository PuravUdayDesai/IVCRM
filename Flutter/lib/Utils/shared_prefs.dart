import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  save(String key, List<String> value) async{
    final prefs =await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  read(String key) async{
    final prefs =await SharedPreferences.getInstance();
    print(prefs.getStringList(key));
    return prefs.getStringList(key);

  }

  remove(String key) async{
    final prefs =await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}


