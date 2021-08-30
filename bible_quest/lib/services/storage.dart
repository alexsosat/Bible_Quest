import 'package:get_storage/get_storage.dart';

class Storage {
  GetStorage storage = GetStorage();

  int get userId => storage.read('userId');

  int get fontSize => storage.read('fontSize');

  Future<void> write(String key, dynamic value) async =>
      await storage.write(key, value);
}
