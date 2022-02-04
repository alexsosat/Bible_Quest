import 'dart:convert';

import 'package:bible_quest/app/modules/login/controllers/authentication_controller.dart';
import 'package:bible_quest/app/modules/store/banners/models/item.dart';
import 'package:bible_quest/app/modules/user/models/current_items.dart';
import 'package:bible_quest/app/modules/user/models/stats/stats.dart';
import 'package:bible_quest/app/modules/user/models/user.dart';
import 'package:bible_quest/app/modules/user/models/user_info.dart';
import 'package:bible_quest/app/modules/user/models/user_readings.dart';
import 'package:bible_quest/app/modules/user/modules/equipment/models/equipment_sections.dart';
import 'package:bible_quest/keys.dart';
import 'package:bible_quest/services/connectivity/api_call.dart';
import 'package:get/get.dart';

class UserProvider {
  /// The path of the requests group.
  static final String path = 'players';

  /// The API client.
  BibleQuestHttpClient _http;

  var userUID = Get.find<AuthenticationController>().userUID;

  UserProvider({
    String token = "",
  }) : this._http = BibleQuestHttpClient(
          baseUrl: getWebUrl() + path,
          // auth: Auth(
          //   token: () => token,
          //   tokenType: 'Bearer',
          //   headerName: 'Authorization',
          // ),
        );

  /// Retrieves whether the user exists on the api
  Future<bool> userExists() {
    return this._http.customGet<bool>(
          path: '$userUID/exists',
          mapper: (json) => json as bool,
        );
  }

  /// Retirieves all user information
  Future<User> getUserAll() => this._http.customGet<User>(
        path: '$userUID',
        mapper: (json) => User.fromJson(json),
      );

  /// Retrieves the user main info
  Future<UserInfo> getUserInfo() => this._http.customGet<UserInfo>(
        path: '$userUID/info',
        mapper: (json) => UserInfo.fromJson(json),
      );

  /// Retrieves the user stats
  Future<Stats> getUserStats() async => this._http.customGet<Stats>(
        path: '$userUID/stats',
        mapper: (json) => Stats.fromJson(json),
      );

  /// Retrieves the user read lectures
  Future<List<UserReadings>?> getUserReadings() =>
      this._http.customGet<List<UserReadings>>(
            path: '$userUID/books_readed',
            mapper: (json) => UserReadings.userReadingsFromJson(json),
          );

  /// Retrieves all the user acquired items
  Future<List<Item>> getAllUserItems() => this._http.customGet<List<Item>>(
        path: '$userUID/items',
        mapper: (json) => List<Item>.from(json.map((x) => Item.fromJson(x))),
      );

  /// Retrieves the user acquired items by [page] filter
  Future<List<Item>> getUserItemsByCategory(EquipmentSectionPage page) =>
      this._http.customGet<List<Item>>(
            path: '$userUID/items/${page.name}',
            mapper: (json) => List<Item>.from(
              json.map((x) => Item.fromJson(x)),
            ),
          );

  /// Creates a new user
  Future<bool> createUser(User user) => this._http.customPost<bool>(
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        mapper: (json) => true, //TODO: check this mapper
      );

  /// Updates the user stats with [userStats] values
  Future updateUserStats(Stats userStats) => this._http.customPut(
        path: '$userUID/items/stats/update',
        body: jsonEncode(userStats.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

  /// Updates the user readings with [readings] values
  Future updateUserReadings(List<UserReadings> readings) =>
      this._http.customPut(
        path: '$userUID/books_readed/update',
        body: jsonEncode(readings),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

  /// Updates the user equiped items with [currentItems] values
  Future updateUserCurrentItems(CurrentItems userCurrentItems) {
    Map<String, Map<String, dynamic>> json = {
      "current_items": userCurrentItems.toJson(),
    };
    return this._http.customPut(
      path: '$userUID/info/current_items/update',
      body: jsonEncode(json),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
  }

  Future updateUserItems(List<Item> userItems) => this._http.customPut(
        path: '$userUID/items/update',
        body: jsonEncode(userItems.map((item) => item.toJson()).toList()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
}
