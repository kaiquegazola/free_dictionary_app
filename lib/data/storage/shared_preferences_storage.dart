import 'package:free_dictionary/core/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements Storage {
  SharedPreferencesStorage({
    required this.prefs,
  });

  final SharedPreferences prefs;

  @override
  Future<bool> containsKey(String key) async {
    return prefs.containsKey(key);
  }

  @override
  Future<String?> getString(String key) async {
    return prefs.getString(key);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return prefs.getStringList(key);
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    await prefs.setStringList(key, value);
  }
}
