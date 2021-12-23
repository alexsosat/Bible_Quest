import 'dart:convert';

import 'package:bible_quest/app/modules/login/controllers/authentication_controller.dart';
import 'package:bible_quest/app/modules/user/models/stats/stats.dart';
import 'package:bible_quest/app/modules/user/models/user.dart';
import 'package:bible_quest/app/modules/user/models/user_info.dart';
import 'package:bible_quest/app/modules/user/models/user_readings.dart';
import 'package:bible_quest/keys.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  var authController = Get.find<AuthenticationController>();

  Future<bool> userExists() async {
    final response = await get(
      '${environment['web_url']}players/${authController.userUID}/exists',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body as bool;
    }
  }

  Future<User> getUserAll() async {
    final response = await get(
      '${environment['web_url']}players/${authController.userUID}/info',
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

  Future<UserInfo> getUserInfo() async {
    final response = await get(
      '${environment['web_url']}players/${authController.userUID}/info',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return UserInfo.fromJson(jsonDecode(response.bodyString!));
    }
  }

  Future<Stats> getUserStats() async {
    final response = await get(
      '${environment['web_url']}players/${authController.userUID}/stats',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return Stats.fromJson(jsonDecode(response.bodyString!));
    }
  }

  Future<List<UserReadings>?> getUserReadings() async {
    final response = await get(
      '${environment['web_url']}players/${authController.userUID}/books_readed',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return UserReadings.userReadingsFromJson(response.bodyString!);
    }
  }

  Future<bool> createUser(User user) async {
    final response = await post(
      '${environment['web_url']}players/',
      user.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.status.hasError) {
      return false;
    } else {
      return true;
    }
  }

  Future updateUserStats(Stats userStats) async {
    final response = await put(
      '${environment['web_url']}players/${authController.userUID}/stats/update',
      jsonEncode(userStats.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.status.hasError) {
      debugPrint(response.bodyString);
      return Future.error(response.statusText!);
    }
  }

  Future updateUserReadings(List<UserReadings> readings) async {
    final response = await put(
      '${environment['web_url']}players/${authController.userUID}/books_readed/update',
      jsonEncode(readings),
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
