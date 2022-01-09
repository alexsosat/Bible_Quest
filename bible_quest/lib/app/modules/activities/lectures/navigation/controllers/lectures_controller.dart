import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/bible.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/book.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/sections.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/providers/bible_provider.dart';
import 'package:bible_quest/app/modules/user/models/user_readings.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

class LecturesController extends GetxController with StateMixin<Bible> {
  var currentSection = PlanSections.main.obs;

  late List<UserReadings>? userReadings;

  int? activeBook;

  @override
  void onInit() {
    fetchPlans();
    super.onInit();
  }

  void refreshContent() {
    change(null, status: RxStatus.loading());
    fetchPlans();
  }

  Future<void> fetchPlans() async {
    try {
      userReadings = await UserProvider().getUserReadings();
      final response = await BibleProvider().getBible(userReadings);
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future updateReadedBooks() async {
    await UserProvider().updateUserReadings(userReadings!);
    refreshContent();
  }
}
