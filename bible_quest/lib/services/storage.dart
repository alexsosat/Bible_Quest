import 'package:bible_quest/app/modules/user/models/current_reading.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  GetStorage getStorage = GetStorage();

  int get userId => getStorage.read('userId');

  double get fontSize => getStorage.read('fontSize');

  CurrentReading? get currentReading {
    final reading = getStorage.read('curReading');
    return reading != null ? CurrentReading.fromJson(reading) : null;
  }

  Future<void> write(String key, dynamic value) async =>
      await getStorage.write(key, value);
}
