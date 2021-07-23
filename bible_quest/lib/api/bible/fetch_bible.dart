import 'dart:convert';

import 'package:bible_quest/bloc/user/user.dart';
import 'package:bible_quest/keys.dart';
import 'package:bible_quest/models/bible/content/chapter_content.dart';
import 'package:bible_quest/models/bible/indexes/bible.dart';
import 'package:get/get.dart';

class ApiBibleService extends GetConnect {
  Future<Bible> getBible() async {
    final response = await get(
        'https://api.scripture.api.bible/v1/bibles/${environment["bible_book"]!}/books?include-chapters=true',
        headers: {'api-key': environment['bible_key']!});

    final readedBooks = Get.find<UserController>().user.booksReaded;

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return Bible.fromJson(jsonDecode(response.bodyString!), readedBooks);
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
