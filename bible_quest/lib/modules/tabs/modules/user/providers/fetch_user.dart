import 'dart:convert';
import 'package:bible_quest/services/storage.dart';
import 'package:get/get.dart';

import 'package:bible_quest/keys.dart';
import 'package:bible_quest/modules/tabs/modules/user/models/user.dart';

class UserService extends GetConnect {
  final userId = Storage().userId;

  Future<User> getUser() async {
    final response = await get(
      '${environment['web_url']}users/$userId',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return User.fromJson(jsonDecode(response.bodyString!));
    }
  }

  Future updateUser(Map<String, dynamic> content) async {
    final response = await put(
      '${environment['web_url']}users/$userId',
      content,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    }
  }
}
