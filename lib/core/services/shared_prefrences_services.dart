import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  setBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  bool getBool(String key) {
    return prefs.getBool(key) ?? false;
  }
}
