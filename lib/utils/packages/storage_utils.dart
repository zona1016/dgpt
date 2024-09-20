import 'package:get_storage/get_storage.dart';

class StorageUtils {
  StorageUtils._();

  static final _box = GetStorage();

  static Future<bool> init() async {
    return await GetStorage.init();
  }

  static T? read<T>(String key) {
    return _box.read(key);
  }

  static write(String key, dynamic value) {
    _box.write(key, value);
  }

  static remove(String key) {
    _box.remove(key);
  }
}
