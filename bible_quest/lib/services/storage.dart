import 'package:bible_quest/models/bible/indexes/current_reading.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  GetStorage getStorage = GetStorage();

  int get userId => getStorage.read('userId');

  double get fontSize => getStorage.read('fontSize');

  CurrentReading get currentReading =>
      CurrentReading.fromJson(getStorage.read('curReading'));

  Future<void> write(String key, dynamic value) async =>
      await getStorage.write(key, value);
}
