import 'package:bible_quest/app/modules/user/models/current_reading.dart';
import 'package:bible_quest/services/storage.dart';
import 'package:get/get.dart';

class CurrentReadingController extends GetxController
    with StateMixin<CurrentReading> {
  @override
  onInit() {
    fetchCurrentReading();
    super.onInit();
  }

  void fetchCurrentReading() async {
    try {
      final reading = Storage().currentReading;
      if (reading != null) {
        change(
          reading,
          status: RxStatus.success(),
        );
      } else {
        change(
          null,
          status: RxStatus.empty(),
        );
      }
    } catch (e) {
      change(
        null,
        status: RxStatus.error(),
      );
    }
  }
}
