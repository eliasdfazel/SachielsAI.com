import 'package:shared_preferences/shared_preferences.dart';

void storeBoolean(String key, bool value) async {

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  await sharedPreferences.setBool(key, value);

}

Future<bool> readBoolean(String key) async {

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  return sharedPreferences.getBool(key) ?? false;
}