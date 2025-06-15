export 'storage.dart';

abstract class Storage {
  Future<void> setString(String key, String value);
  Future<String?> getString(String key);
  Future<void> setStringList(String key, List<String> value);
  Future<List<String>?> getStringList(String key);
  Future<void> remove(String key);
  Future<bool> containsKey(String key);
}
