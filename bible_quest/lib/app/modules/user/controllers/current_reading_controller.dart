import 'package:bible_quest/app/modules/user/models/current_reading.dart';
import 'package:bible_quest/services/storage.dart';
import 'package:get/get.dart';

class CurrentReadingController extends GetxController {
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
      // isLoading(true);
      currentReading(Storage().currentReading);
    } finally {
      // isLoading(false);
    }
  }
}
