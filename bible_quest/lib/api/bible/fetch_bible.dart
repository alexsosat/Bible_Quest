import 'dart:convert';

import 'package:bible_quest/keys.dart';
import 'package:bible_quest/models/bible/bible.dart';
import 'package:get/get.dart';

class ApiBibleService extends GetConnect {
  Future<Bible> getBible() async {
    final response = await get(
        'https://api.scripture.api.bible/v1/bibles/${environment["bible_book"]!}/books?include-chapters=true',
        headers: {'api-key': environment['bible_key']!});

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return Bible.fromJson(jsonDecode(response.body));
    }
  }
}
