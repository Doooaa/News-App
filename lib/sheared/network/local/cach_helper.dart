import 'package:shared_preferences/shared_preferences.dart';
// declear init in main

class cashHelper{

static SharedPreferences? sharedPreferences;
  
  static init()async{
    sharedPreferences= await SharedPreferences.getInstance();
  }
  static Future<bool> putBooleanData({required key ,value})async{  //get the value of theme and save it in a local 
  return await  sharedPreferences!.setBool(key, value);
  }
   static bool? getBooleanData({required String key}){ //on change theme button
     return  sharedPreferences!.getBool(key);
  }

}

