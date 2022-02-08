import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/bible.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/indexes/sections.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/providers/bible_provider.dart';
import 'package:bible_quest/app/modules/user/models/user_readings.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/globals/controllers/api_controller_template.dart';
import 'package:get/get.dart';

class BibleController extends ApiControllerTemplate<Bible> {
  var currentSection = PlanSections.main.obs;

  late List<UserReadings>? userReadings;

  @override
  Future loadData() async {
    change(null, status: RxStatus.loading());
    await call<List<UserReadings>?>(
      httpCall: () => UserProvider().getUserReadings(),
      onSuccess: (readings) => userReadings = readings,
      addToData: false,
      onCallError: (error) => throw error,
      onError: (error) => change(
        null,
        status: RxStatus.error(error.toString()),
      ),
    );

    await call<Bible>(
      httpCall: () => BibleProvider().getBible(userReadings),
      onSuccess: (bible) => change(bible, status: RxStatus.success()),
      onCallError: (error) => throw error,
      onError: (error) => change(
        null,
        status: RxStatus.error(error.toString()),
      ),
    );
  }

  Future updateReadedBooks() async {
    await UserProvider().updateUserReadings(userReadings!);
    loadData();
  }
}
