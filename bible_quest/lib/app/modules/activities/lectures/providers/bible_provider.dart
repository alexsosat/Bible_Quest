import 'dart:convert';

import 'package:bible_quest/app/modules/activities/lectures/models/bible/content/chapter_content.dart';
import 'package:bible_quest/app/modules/activities/lectures/models/bible/indexes/bible.dart';
import 'package:bible_quest/app/modules/user/models/user_readings.dart';
import 'package:bible_quest/keys.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class BibleProvider extends GetConnect {
  Future<Bible> getBible(List<UserReadings>? readPlans) async {
    final response = await get(
        'https://api.scripture.api.bible/v1/bibles/${environment["bible_book"]!}/books?include-chapters=true',
        headers: {'api-key': environment['bible-key']!});

    Map<String, dynamic>? readedBibleBooks = {};
    if (readPlans != null) {
      final biblePlan =
          readPlans.firstWhereOrNull((element) => element.planName == "Bible");

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
