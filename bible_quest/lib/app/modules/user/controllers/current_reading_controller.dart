import 'package:bible_quest/app/modules/user/models/current_reading.dart';
import 'package:bible_quest/services/storage.dart';
import 'package:get/get.dart';

class CurrentReadingController extends GetxController
    with StateMixin<CurrentReading> {
  var currentReading = CurrentReading(
    reference: "",
    chapterProgress: 0,
  ).obs;

  CurrentReading get reading => currentReading.value;

  @override
  onInit() {
    fetchCurrentReading();
    super.onInit();
  }

  void fetchCurrentReading() async {
    try {
      currentReading(Storage().currentReading);
      change(
        currentReading.value,
        status: RxStatus.success(),
      );
    } catch (e) {
      change(
        currentReading.value,
        status: RxStatus.error(),
      );
    }
  }
}
