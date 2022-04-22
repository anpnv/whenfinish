import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _prefs;

  static Future initLocal() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future set(String key, int value) async {
    if (_prefs == null) {
      await initLocal();
    }
    await _prefs!.setInt(key, value);
  }

  static int get(String id) => _prefs?.getInt(id) ?? 0;

  static Future remove(String id) async {
    await _prefs!.remove(id);
  }
}
