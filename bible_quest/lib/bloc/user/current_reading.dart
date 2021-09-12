import 'package:bible_quest/bloc/abstract_model.dart';
import 'package:bible_quest/models/bible/indexes/current_reading.dart';
import 'package:bible_quest/services/storage.dart';
import 'package:get/get.dart';

class CurrentReadingController extends ControllerTemplate {
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

  @override
  refreshContent() {
    fetchCurrentReading();
    super.refreshContent();
  }

  void fetchCurrentReading() async {
    try {
      isLoading(true);
      currentReading(Storage().currentReading);
    } finally {
      isLoading(false);
    }
  }
}
