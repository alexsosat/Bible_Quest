import 'dart:convert';

import 'package:bible_quest/app/modules/user/models/user.dart';
import 'package:bible_quest/services/storage.dart';
import 'package:get/get.dart';

import '../../../../keys.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

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
