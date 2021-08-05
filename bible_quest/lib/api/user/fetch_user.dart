import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:bible_quest/keys.dart';
import 'package:bible_quest/models/user/user.dart';

class UserService extends GetConnect {
  GetStorage storage = GetStorage();

  int get userId => storage.read('userId');

  Future<User> getUser() async {
    final response = await get(
      '${environment['web_url']}users/${this.userId}',
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
      '${environment['web_url']}users/${this.userId}',
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
