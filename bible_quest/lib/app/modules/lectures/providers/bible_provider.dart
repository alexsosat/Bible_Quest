import 'dart:convert';

import 'package:bible_quest/app/modules/lectures/models/bible/bible_exports.dart';
import 'package:bible_quest/app/modules/user/controllers/user_controller.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/keys.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class BibleProvider extends GetConnect {
  Future<Bible> getBible() async {
    final response = await get(
        'https://api.scripture.api.bible/v1/bibles/${environment["bible_book"]!}/books?include-chapters=true',
        headers: {'api-key': environment['bible-key']!});

    final readedPlans = await UserProvider().getUserReadings();
    Map<String, dynamic>? readedBibleBooks = {};
    if (readedPlans != null) {
      final biblePlan = readedPlans
          .firstWhereOrNull((element) => element.planName == "Bible");

      readedBibleBooks = biblePlan != null ? biblePlan.readed : {};
    }

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return Bible.fromJson(jsonDecode(response.bodyString!), readedBibleBooks);
    }
  }

  Future<ChapterContent> getChapter(String chapterId) async {
    final response = await get(
        'https://api.scripture.api.bible/v1/bibles/${environment["bible_book"]!}/chapters/$chapterId?content-type=text&include-notes=false&include-titles=false&include-chapter-numbers=false&include-verse-numbers=true&include-verse-spans=false',
        headers: {'api-key': environment['bible_key']!});

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return ChapterContent.fromJson(jsonDecode(response.bodyString!));
    }
  }
}
