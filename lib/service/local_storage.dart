


import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

// se ocupa la propiedad late para decirle que cuando lo
//vaya a utilizar lo ocupe
  static late SharedPreferences prefs;

//por ahora no esta regresando nada con el future

  static Future<void> configurePrefs() async{
    prefs = await SharedPreferences.getInstance();

  }

}